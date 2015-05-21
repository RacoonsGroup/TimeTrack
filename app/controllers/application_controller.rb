class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "Secret", password: "voslavuenotu"
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: exception.message
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update).insert(-1, :name)
  end
end
