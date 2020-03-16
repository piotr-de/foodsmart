class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :energy
      t.float :carbs
      t.float :fat
      t.float :fibre
      t.float :protein
      t.jsonb :data

      t.timestamps
    end
  end
end
