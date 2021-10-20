class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    delivery = Delivery.new(delivery_params)
    delivery.save
    redirect_back(fallback_location: public_root_path)
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end
end
