class Public::ProductsController < ApplicationController
<<<<<<< HEAD

  def index
    @produ
=======
  
  def index
    @products = Product.all
>>>>>>> d4c86b778bbdb603b44a154ed9c545e62b9c5fba
  end

  def show
    @product = Product.find(params[:id])
<<<<<<< HEAD
    @cart_item = CartItem.new
=======
>>>>>>> d4c86b778bbdb603b44a154ed9c545e62b9c5fba
  end
end
