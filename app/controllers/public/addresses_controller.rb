class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer
    @addresses = Address.all
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Adress.find(params[:id])
  end
  
  def update
    @address.update
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
