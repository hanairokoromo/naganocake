class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end
end
