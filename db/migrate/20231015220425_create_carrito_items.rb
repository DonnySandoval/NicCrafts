class CreateCarritoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :carrito_items do |t|
      t.references :carrito, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
