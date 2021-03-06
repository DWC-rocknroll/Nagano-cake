class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
    @cart_item_quantity = CartItem.new
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to public_cart_items_path(cart_item)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back(fallback_location: public_root_path)
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_back(fallback_location: public_root_path)
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:quantity, :product_id)
  end

end