class SoukoZaiko < ApplicationRecord
  enum stock_type: { 'available_stock': '01', 'sold_stock': '02' }

  validates :warehouse_code, inclusion: { in: %w[EAST WEST], message: '%<value>s is not a valid warehouse code' }
end
