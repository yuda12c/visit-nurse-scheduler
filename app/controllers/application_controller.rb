class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :worktime, :eligibility])
  end
end
