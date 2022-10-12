class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'

  def public?
    return true if public
  end

  def sum
    s = 0
    recipe_foods.each do |recipe_food|
      s += recipe_food.value
    end
    s
  end
end
