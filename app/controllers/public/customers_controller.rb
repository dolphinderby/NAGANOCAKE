class Public::CustomersController < ApplicationController

  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end
  
  def update
   @customer = current_customer
   if @customer.update(current_customer)
      flash[:notice] = "You have updated user successfully."
      redirect_to customers_my_page_path(@customer.id)
   else
      render :edit
   end
  end

  def confirm
  end
end
