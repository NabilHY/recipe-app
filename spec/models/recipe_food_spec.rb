require 'rails_helper'
require 'ffi'

RSpec.describe RecipeFood, type: :model do
  subject do
    user = User.new(name: 'Test User')
    recipe = Recipe.new(user:, name: 'Paella recipe', preparation_time: '15 Minutes',
                        cooking_time: '30 Minutes', description: 'Spanish dish made of spicy rice and sea food',
                        public: true)
    food = Food.new(user:, name: 'Paella', measurement_unit: 'g', price: 4, quantity: 250)
    RecipeFood.new(recipe:, food:, quantity: 1)
  end

  it 'returns the recipe name' do
    recipe = subject.recipe.name
    expect(recipe).to eq('Paella recipe')
  end

  it 'returns the food name' do
    food = subject.food.name
    expect(food).to eq('Paella')
  end

  it 'quantity is valid' do
    expect(subject.quantity).to eq(1)
  end
end
