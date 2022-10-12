class PublicRecipesController < ApplicationController
    def index
        @recipes = Recipe.all
        @public_recipes = @recipes.select { |recipe| recipe.public == true }
    end
end
