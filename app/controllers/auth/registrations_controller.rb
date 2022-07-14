class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

   # POST /resource

  

  private
  def sign_up_params

    params.permit(:name,:email,:password,:password_confirmation,:image)
    
  end
end
