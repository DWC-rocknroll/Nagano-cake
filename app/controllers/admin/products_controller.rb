class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_product_path(product.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(
    :genre_id,
    :name,
    :introduction,
    :tax_out_price,
    :image,
    :is_sale_active,)
  end
end
