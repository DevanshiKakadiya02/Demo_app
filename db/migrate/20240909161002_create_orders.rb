class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :order_number, null: false
      t.integer :total_amount, default: 0
      t.string :delivery_zipcode
      t.string :delivery_state
      t.string :delivery_city
      t.string :delivery_area
      t.string :delivery_address
      t.integer :tax, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
