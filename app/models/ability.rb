class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
      elsif user.user?
        cannot :manage, :all
        can :read, Notification
        can :create, :time_entry
        can :manage, TimeEntry, user_id: @user.id if @user
      elsif user.customer?
        cannot :create, :all
        can :read, :time_entries
      end
  end
end
