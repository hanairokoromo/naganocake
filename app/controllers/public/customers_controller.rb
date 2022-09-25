class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customer_path
  end

  def unsubscribe
    @customer = current_customer
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :address, :telephone_number, :is_deleted)
  end
end