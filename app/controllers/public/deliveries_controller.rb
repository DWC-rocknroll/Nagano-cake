class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries
  end

  def create
    delivery = Delivery.new(delivery_params)
    delivery.customer_id = current_customer.id
    delivery.save
    redirect_back(fallback_location: public_root_path)
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_back(fallback_location: public_root_path)
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to  public_deliveries_path(delivery)
  end

  private
  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end
end
