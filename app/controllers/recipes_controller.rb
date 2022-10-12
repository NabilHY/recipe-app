class RecipesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @recipes = @user.recipes
    end
    def show
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:id])
        @foods = Recipe_food.where(recipe_id: @recipe.id) 
    end
    def new
        @recipe = Recipe.new
    end
    def create
        @recipe = current_user.recipes.new(recipe_params)
        respond_to do |format|
            if @recipe.save
                format.html { redirect_to user_recipes_path, notice: 'Recipe was successfully created.' }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
    def recipe_params
        params.require(:recipe).permit(:name, :description, :public)
    end
end
