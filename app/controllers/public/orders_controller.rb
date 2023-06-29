class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @subtotal = params[:total_price]
    if current_customer.cart_items.count == 0
      redirect_to cart_items_path
    end
  end

  def index
    @orders = current_customer.orders
    @postage = 800
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    @order.save
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.amount = cart.amount
      order_item.purchase_price = cart.item.price
      order_item.save
    end
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @subtotal = params[:order][:total_price]
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.fullname
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
      @order.name = params[:order][:address_name]
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :total_price, :postage)
  end

end
