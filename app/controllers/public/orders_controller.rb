class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer

  end

  def confirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    @order.customer_id = current_customer.id
    if params[:order][:flag] == "1"
      @order.address = current_customer.residence
      @order.deliveries_postcode = current_customer.postcode
      @order.name = current_customer.last_name +
                    current_customer.first_name
    elsif params[:order][:flag] == "2"
      @delivery = Delivery.find(params[:order][:juusyo])
      @order.address = @delivery.address
      @order.deliveries_postcode = @delivery.postcode
      @order.name = @delivery.name
    elsif params[:order][:flag] == "3"
      @order.address = params[:order][:address]
      @order.deliveries_postcode = params[:order][:deliveries_postcode]
      @order.name = params[:order][:name]
    end

  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    cart_items = current_customer.cart_items
    order.save
    cart_items.each do |cart_item|
      order_detail = order.order_details.new
      order_detail.order_id = order.id
      order_detail.product_id = cart_item.product_id
      order_detail.order_quantity = cart_item.quantity
      order_detail.tax_in_price = cart_item.product.tax_out_price*1.10
      order_detail.save!
      cart_item.destroy
    end
    redirect_to complete_public_orders_path(order)
  end

  def complete
  end

  def index
    @orders = current_customer.orders.includes(:order_details, :products)
  end

  def show
    @cart_item = current_customer.cart_items
    @orders = current_customer.orders
  end

  private
  def order_params
    params.require(:order).permit(
    :order_id,
    :address,
    :postal_code,
    :name,
    :postage,
    :total_price,
    :payment_method,
    :deliveries_postcode,
    :status
    )
  end
end