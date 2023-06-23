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

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save!
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.amount = cart.amount
      order_item.purchase_price = order.payment_method
      order_item.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total_price = params[:order][:total_price]
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name, current_customer.first_name
    elsif params[:order][:address_number] == "2"
      address_new = current_customer.addresses.new(address_params)
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :total_price, :postage)
  end

end
