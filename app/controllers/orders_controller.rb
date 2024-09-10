class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save!
      redirect_to new_order_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def address_lookup
    address = Jpostcode.find(params[:zipcode])
    address = address.first if address.class == Array
    if address.present?
      render json: { city: address.city, state: address.prefecture, area: address.town }
    else
      render json: { city: nil, state: nil, area: nil }, status: :not_found
    end
  end 

  private

  def order_params
    params.require(:order).permit(:delivery_zipcode, :delivery_state, :delivery_city, :delivery_area, :delivery_address,
                                  :tax, order_items_attributes: %i[id sku_code quantity price total_amount _destroy])
  end
end
