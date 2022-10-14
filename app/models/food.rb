class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'food_id'

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

end
