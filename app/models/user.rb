class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
	before_create :set_default_user_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body
  ROLE = %w(user admin)

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
end
