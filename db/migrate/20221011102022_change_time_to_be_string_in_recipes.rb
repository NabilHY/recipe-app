class ChangeTimeToBeStringInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :cooking_time, :string
    change_column :recipes, :preparation_time, :string 
  end
end
