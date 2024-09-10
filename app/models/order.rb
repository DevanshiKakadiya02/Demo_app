class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true
  before_create :generate_order_number

  private

  def generate_order_number
    today = Date.today.strftime('%Y%m%d')
    last_order = Order.where('order_number LIKE ?', "#{today}%").order('order_number DESC').first
    last_number = last_order&.order_number&.last(5).to_i || 0
    self.order_number = format('%<date>s%<number>05d', date: today, number: last_number + 1)
  end
end
