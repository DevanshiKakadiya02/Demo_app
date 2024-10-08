# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_909_161_157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'order_items', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.string 'sku_code'
    t.integer 'quantity', default: 0
    t.integer 'price', default: 0
    t.integer 'total_amount', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'order_number', null: false
    t.integer 'total_amount', default: 0
    t.string 'delivery_zipcode'
    t.string 'delivery_state'
    t.string 'delivery_city'
    t.string 'delivery_area'
    t.string 'delivery_address'
    t.integer 'tax', default: 0
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'prefecture_codes', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'code', null: false
    t.string 'ew_flag', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'souko_zaikos', force: :cascade do |t|
    t.string 'warehouse_code', null: false
    t.string 'sku_code', null: false
    t.string 'stock_type'
    t.integer 'stock'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'orders', 'users'
end
