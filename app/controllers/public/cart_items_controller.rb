class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to public_cart_items_path(cart_item)
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:quantity, :product_id)
  end

end
