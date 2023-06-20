class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def complete
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @postage = 800
  end

end
