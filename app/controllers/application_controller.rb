class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
    public_customer_path(current_customer)
  end
  
  def after_sign_in_path_for(resource)
    public_root_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    public_root_path
  end
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :residence, :phone_number, :is_active])
  end

end
