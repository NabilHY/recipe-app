class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'

  validates :name, presence: { strict: true }
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :preparation_time, presence: { strict: true }, length: { maximum: 20 }
  validates :cooking_time, presence: { strict: true }, length: { minimum: 1, maximum: 20 }
  validates :description, presence: { strict: true }, length: { minimum: 1, maximum: 1000 }
  validates :public, inclusion: { in: [true, false] }

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
