class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  require 'securerandom'


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if auth_hash
      if user = User.find_by(email: auth_hash[:info][:nickname] + "@github.auth")
	sign_in(user)
	
      else
	user = User.create(email: auth_hash[:info][:nickname] + "@github.auth", password: SecureRandom.hex)
	sign_in(user)
      end
	
      redirect_to root_path, notice: "Signed in successfully!"
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
