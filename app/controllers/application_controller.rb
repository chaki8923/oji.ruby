class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # deviseコントローラにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
      # devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    end
end
