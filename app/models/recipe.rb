class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :measurement_unit, inclusion: { in: %w(g kg ml l)
  validates :price , numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  

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
