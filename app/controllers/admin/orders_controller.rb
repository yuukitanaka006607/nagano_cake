class Admin::OrdersController < ApplicationController

  def show
    #@order_item = OrderItem.find(params[:id])
    @order = Order.find(params[:id])
  end
end
