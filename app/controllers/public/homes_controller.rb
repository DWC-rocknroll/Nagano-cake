class Public::HomesController < ApplicationController
  def top
    @products = Product.where(is_sale_active: true).page(params[:page]).per(4)
  end

  def about
  end
end
