class Public::OrdersController < ApplicationController
  def new

  end

  def confirm
    @cart_item = CartItem.all
    @order = Order.find(params[:id])
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
    # @order_details = @order.order_details
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
