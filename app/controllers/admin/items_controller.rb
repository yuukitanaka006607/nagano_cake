class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def item_params
    parmit.require(:item).permit(:image, :name, :introduction, :price)
  end
end