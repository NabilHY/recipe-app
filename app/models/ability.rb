# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role
      can :manage, :all
    else
      can :read, :all
      can :create, Recipe
      can :update, Recipe do |recipe|
        recipe.user == user
      end
      can :destroy, Recipe do |recipe|
        recipe.user == user
      end
    end
  end
end
