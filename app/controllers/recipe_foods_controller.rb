class RecipeFoodsController < ApplicationController
  def index; end

  def new
    @recipe_food = RecipeFood.new
    @foods = []
    current_user.foods.each do |food|
      @foods << [food.name, food.id]
    end
  end

  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = @recipe.recipe_foods.new(
      recipe: @recipe,
      food_id: recipe_food_params[:food_id],
      quantity: recipe_food_params[:quantity]
    )
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe.id), notice: 'ingridiant was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe was successfully destroyed.' }
    end
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
end
