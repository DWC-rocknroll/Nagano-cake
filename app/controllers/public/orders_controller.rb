class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer

  end

  def confirm
    @cart_item = CartItem.all
    @order = Order.new(order_params)
    @order.postage = 800
    @order.customer_id = current_customer.id
    @order.total_price = 10000
    if params[:order][:flag] == "1"
      @order.address = current_customer.residence
      @order.deliveries_postcode = current_customer.postcode
      @order.name = current_customer.first_name +current_customer.last_name
    end
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
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
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
