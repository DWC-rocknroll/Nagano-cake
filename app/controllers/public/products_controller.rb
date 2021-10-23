class Public::ProductsController < ApplicationController

  def index
    @produ
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end
