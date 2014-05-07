class User < ActiveRecord::Base
  belongs_to :qualification
  has_many :time_entries
  has_and_belongs_to_many :articles

  ROLE = %w(user admin)

  before_create :set_default_user_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :qualification_id, :name, :type


  def set_default_user_role
    self.role = User.default_role unless role
  end

  def self.default_role
    ROLE.first
  end

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end

  def customer?
    type == 'Customer' || self.is_a?(Customer)
  end

  def read? article
    articles.where(id: article.id).any?
  end

  # Devise's methods for approve proccess
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end
end
