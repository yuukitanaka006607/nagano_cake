class Admin::OrdersController < ApplicationController

  def show
    @order_item = OrderItem.find(params[:id])
    @order_items = OrderItem.all
    @sum = 0
  end
end
