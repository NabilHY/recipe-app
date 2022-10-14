class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.order('id DESC')
  end

  def show
    @food = current_user.foods.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @recipe_foods = @food.recipe_foods
    @recipe_foods.each(&:destroy)
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_path, notice: 'Food was successfully destroyed.' }
    end
  end

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :quantity, :price)
  end
end
