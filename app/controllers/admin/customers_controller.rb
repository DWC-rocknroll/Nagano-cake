class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customer = Customer.new
  end

  def show
    
  end

  def edit
  end

  def update
  end
end
