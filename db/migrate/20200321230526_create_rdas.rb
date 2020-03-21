class CreateRdas < ActiveRecord::Migration[6.0]
  def change
    create_table :rdas do |t|
      t.string :name
      t.float :amount
      t.string :gender
      t.string :age
      t.references :nutrient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
