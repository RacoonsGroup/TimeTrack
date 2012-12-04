class User < ActiveRecord::Base
  ROLE = %w(user admin)

  before_create :set_default_user_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  has_many :time_entries
  has_and_belongs_to_many :articles

  def set_default_user_role
    self.role = User.default_role unless role
  end

  def self.default_role
    ROLE.first
  end

  def admin?
    role == 'admin'
  end

  def read? article
    articles.where(id: article.id).any?
  end

end
