class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :create, :time_entry
        can :can :manage, TimeEntry, user_id: @user.id
      end
  end
end
