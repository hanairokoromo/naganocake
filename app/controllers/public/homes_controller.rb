class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, only: [:about]
  def top
    @items = Item.all
  end

  def about
  end
end
