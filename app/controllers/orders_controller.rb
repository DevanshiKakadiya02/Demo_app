class OrdersController < ApplicationController
	def new
		@order = Order.new
		@order.order_items.build
	end

	def create
		@order = current_user.orders.new(order_params)
		if @order.save!
			redirect_to @order, notice: 'Order was successfully created.'
		else
			render :new
		end
	end

	private

	def order_params
		params.require(:order).permit(:delivery_zipcode, :delivery_state, :delivery_city, :delivery_area, :delivery_address, :tax, order_items_attributes: [:id, :sku_code, :quantity	, :price, :total_amount, :_destroy])
	end
end
  