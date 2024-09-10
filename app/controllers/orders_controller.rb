class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.order_items.build
		@souko_zaikos = SoukoZaiko.all
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to new_order_path, notice: 'Order was successfully created.'
    end
  end

  def address_lookup
    address = Jpostcode.find(params[:zipcode])
		@order = Order.new(delivery_zipcode: params[:zipcode])
    @order.order_items.build
    address = address.first if address.class == Array
    if address.present?
			ew_flag = PrefectureCode.find_by(name: address.prefecture).ew_flag
			@souko_zaikos = SoukoZaiko.where(warehouse_code: ew_flag.upcase)
      @order.delivery_city = address.city
			@order.delivery_state = address.prefecture
			@order.delivery_area = address.town
    end
  end 	

  private

  def order_params
    params.require(:order).permit(:delivery_zipcode, :delivery_state, :delivery_city, :delivery_area, :delivery_address,
                                  :tax, order_items_attributes: %i[id sku_code quantity price total_amount _destroy])
  end
end
