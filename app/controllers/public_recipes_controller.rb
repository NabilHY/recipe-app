class PublicRecipesController < ApplicationController
  def index
    @users = User.all
    @recipes = Recipe.all
    @public_recipes = @recipes.select { |recipe| recipe.public == true }
  end
end
