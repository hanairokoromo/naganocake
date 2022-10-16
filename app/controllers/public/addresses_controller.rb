class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @addresses = current_customer.address
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Adress.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path(@address.id)
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
