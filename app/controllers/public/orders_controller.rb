class Public::OrdersController < ApplicationController
  def new

  end

  def confirm
    @cart_item = CartItem.all
    @order = Order.find(parms[:id])
  end

  def create
    order = Order.new(order_params)
    order.current_id = current_customer.id
    order.save
    redirect_to  public_order_complete_path(order)
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(
    :postal_code,
    :adress,
    :name,
    :postage,
    :total_price,
    :payment_method,
    :deliveries_postcode,
    :status)
  end
end
