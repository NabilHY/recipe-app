class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @public_recipes = @recipes.select { |recipe| recipe.public == true }
    @prices = []
    @public_recipes.each do |recipe|
      @prices << recipe.recipe_foods.map { |recipe_food| recipe_food.food.price }.sum
    end
  end
end
