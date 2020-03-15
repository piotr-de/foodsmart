class AddEnergyCarbsFatProteinToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :energy, :float
    add_column :recipes, :carbs, :float
    add_column :recipes, :fat, :float
    add_column :recipes, :protein, :float
  end
end
