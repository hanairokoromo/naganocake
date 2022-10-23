class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i) #to_iで入力した個数を整数に変換
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def create
    @cart_items = CartItem.all
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @update_cart_item = CartItem.find_by(item: @cart_item.item)
    #カートに入れた商品がカート内商品にあったときは数を足す
    if @update_cart_item.present? && @cart_item.valid? #present? 存在すればtrue
       @cart_item.amount += @update_cart_item.amount #カートに追加した個数 + カートにある個数 = 合計個数
       @update_cart_item.update(amount: @cart_item.amount) #quantitiy(@cart_productのquantity)
    elsif @cart_item.save #false = カートに同じ商品がない時
      redirect_to cart_items_path
    else
      @item = @cart_item.item#14行目の@carp_productのproduct_idを探してくる
      render :index
    end
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
