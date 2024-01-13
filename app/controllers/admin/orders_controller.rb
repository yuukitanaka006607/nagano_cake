class Admin::OrdersController < ApplicationController

  def show
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @sum = 0
    @order.postage = 800
  end
end
