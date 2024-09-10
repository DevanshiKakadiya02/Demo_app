class CreatePrefectureCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :prefecture_codes do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :ew_flag, null: false

      t.timestamps
    end
  end
end
