class FoodsController < ApplicationController
  def index
    @foods = Food.all.order('id DESC')
  end
end
