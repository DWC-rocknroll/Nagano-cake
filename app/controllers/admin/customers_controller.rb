class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admins_customers_path(customer)
  end

  private
  def customer_params
    params.require(:customer).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :is_active,
      :postcode,
      :address,
      :phone_number)
  end
end
