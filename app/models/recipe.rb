class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'

  def public?
    return true if public
  end
end
