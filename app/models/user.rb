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


  def get_time_entries(from_t, to_t)
    # Convert time
    from_times = from_t.scan(/(.*)\/(.*)\/(.*)\s(.*):(.*)/mi)[0]
    to_times = to_t.scan(/(.*)\/(.*)\/(.*)\s(.*):(.*)/mi)[0]

    from_t = Time.gm(from_times[2], from_times[0], from_times[1], from_times[3], from_times[4])
    to_t = Time.gm(to_times[2], to_times[0], to_times[1], to_times[3], to_times[4])

    # Get time entries
    real_time = 0
    time_points = 0

    tes = TimeEntry.where("user_id = ? AND created_at >= ? AND created_at <= ?",
                           self.id, from_t, to_t)
    tes.each do |te|
      real_time += te.real_time or 0
      time_points += te.time_points or 0
    end
    [time_points, real_time]
  end
end
