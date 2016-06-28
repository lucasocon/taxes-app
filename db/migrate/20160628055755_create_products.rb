class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.boolean :imported, default: false

      t.timestamps null: false
    end
  end
end
