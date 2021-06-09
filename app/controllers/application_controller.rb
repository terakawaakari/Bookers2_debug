class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :reject_inactive_user, if: :devise_controller?, only: [:create]

  def after_sign_in_path_for(resource)
    user_path(@user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def reject_inactive_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        redirect_to new_user_session_path
      end
    end
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
