class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
      else
        can :create, :time_entry
        can :manage, TimeEntry, user_id: @user.id if @user
        cannot :manage, :all
      end
  end
end
