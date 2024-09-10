class SoukoZaiko < ApplicationRecord
  enum stock_type: { 'available_stock': '01', 'sold_stock': '02' }

  validates :warehouse_code, inclusion: { in: %w[EAST WEST], message: '%<value>s is not a valid warehouse code' }
  after_save :update_stock_type

  private

  def update_stock_type
    self.update_columns(stock_type: '02') if stock.zero?
  end
end
