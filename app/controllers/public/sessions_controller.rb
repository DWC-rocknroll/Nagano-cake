# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    public_root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    customer = Customer.find_by(email: params[:customer][:email])
    if customer
      if customer.is_active == true
        redirect_to public_root_path(current_customer)
      elsif customer.is_active == false
        redirect_to public_root_path
      end
    else
      redirect_to new_customer_session_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

 # protected

  # If you have extra params to permit, append them to the sanitizer.
  ##  devise_parameter_sanitizer.permit(:sign_in, keys: [:email])

end
