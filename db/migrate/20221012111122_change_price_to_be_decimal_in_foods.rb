class ChangePriceToBeDecimalInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :decimal
  end
end
