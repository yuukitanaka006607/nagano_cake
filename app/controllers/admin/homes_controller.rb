class Admin::HomesController < ApplicationController

  def top
    @order_items = OrderItem.page(params[:page])
  end
end