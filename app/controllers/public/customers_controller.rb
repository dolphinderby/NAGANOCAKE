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

  def withdrawal
    @customer = Customer.find(current_customer)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

end
