class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :otp_attempt])
       devise_parameter_sanitizer.permit(:sign_in, keys: [:phone, :otp_attempt])
      devise_parameter_sanitizer.permit(:account_update, keys: [:mobile,:name,:otp_attempt])
  end

end
