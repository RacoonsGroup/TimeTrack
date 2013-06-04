class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
      else
        cannot :manage, :all
        can :read, Notification
        can :create, :time_entry
        can :manage, TimeEntry, user_id: @user.id if @user
      end
  end
end
