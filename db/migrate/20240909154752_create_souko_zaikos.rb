class CreateSoukoZaikos < ActiveRecord::Migration[7.1]
  def change
    create_table :souko_zaikos do |t|
      t.string :warehouse_code, null: false
      t.string :sku_code, null: false
      t.string :stock_type
      t.integer :stock

      t.timestamps
    end
  end
end
