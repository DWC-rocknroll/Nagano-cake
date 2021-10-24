class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer

  end

  def confirm
    @cart_item = CartItem.all
    @order = Order.find(1)
  end

  def create
    cart_item = current_customer.cart_item
    order = Order.new(order_params)
    order.customer_id = current_customer.id
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
    :order_id,
    :address,
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
