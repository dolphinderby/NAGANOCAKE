class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @total_price = params[:total_price]
  end

  def index
  end

  def show
  end

  def complete
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total_price = params[:order][:total_price]
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
      address_new = current_customer.addresses.new(address_params)
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_price)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
