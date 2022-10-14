class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'

<<<<<<< HEAD
  validates :name, presence: { strict: true }
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :preparation_time, presence: { strict: true }, length: { maximum: 20 }
  validates :cooking_time, presence: { strict: true }, length: { minimum: 1, maximum: 20 }
  validates :description, presence: { strict: true }, length: { minimum: 1, maximum: 1000 }
  validates :public, inclusion: { in: [true, false] }

=======
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :measurement_unit, inclusion: { in: %w(g kg ml l)
  validates :price , numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  
>>>>>>> 7ce810045091ea3f11a44cd0590b0c2d40a254a4

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
