class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    if user.admin?
      can :manage, :all
    else
      can :manage, Recipe, user_id: user.id
      can :manage, Food, user_id: user.id
    end
  end
end
