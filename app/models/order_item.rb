class OrderItem < ApplicationRecord
  belongs_to :order
  after_create :manage_stock_items

  def manage_stock_items
    ew_flag = PrefectureCode.find_by(name: order.delivery_state).ew_flag
    souko_zaiko = SoukoZaiko.find_by(warehouse_code: ew_flag.upcase, sku_code:)
    souko_zaiko.update(stock: souko_zaiko.stock - quantity)
  end
end
