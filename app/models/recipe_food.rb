class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def value
    quantity * food.price
  end
end
