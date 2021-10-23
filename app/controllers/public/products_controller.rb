class Public::ProductsController < ApplicationController
  
  def index
    @products = Product.where(is_sale_active: true).page(params[:page]).per(8)
    @quantity = Product.count
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end
