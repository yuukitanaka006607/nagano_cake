class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
  end

 def create

 end


  private

  def order_params
    params.require(:order).permit(:address_id, :payment_method )
  end

end