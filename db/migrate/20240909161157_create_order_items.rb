class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :sku_code
      t.integer :quantity, default: 0
      t.integer :price, default: 0
      t.integer :total_amount, default: 0

      t.timestamps
    end
  end
end
