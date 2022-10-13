class GeneralShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(ing_params[:id])
    @shopping_list = []
    foods = {}
    @sum = 0
    current_user.foods.each do |food|
      foods[food.name] = food.quantity
    end
    recipe_foods = @recipe.recipe_foods
    recipe_foods.each do |recipe_food|
      name = Food.find(recipe_food.food_id).name
      price = Food.find(recipe_food.food_id).price
      unless foods.include?(name)
        @shopping_list.push(recipe_food)
        @sum += recipe_food.quantity * price
      end
    end
  end

  def ing_params
    params.require(:recipe).permit(:id)
  end
end
