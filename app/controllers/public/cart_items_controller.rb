class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to cart_items_path
  end
  
  def index
    @cart_item = CartItem.all
    @sum = 0
  end
  
  def destroy
    cart_item =CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
