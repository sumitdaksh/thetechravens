class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 100
      t.string :sku, null: false, limit: 100
      t.decimal :price, precision: 18, scale: 2
      t.integer :stock_quantity

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
