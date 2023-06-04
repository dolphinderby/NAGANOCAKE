class Public::CustomersController < ApplicationController
  
  def show
    @cuttomer = Customer.find(params[:id])
  end

  def edit
  end

  def confirm
  end
end
