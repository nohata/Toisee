class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception


  def production_not_send_mail
    if Rails.env.production?
      redirect_to top_show_path, warning: '本番環境ではメール送信しません'
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
      top_show_path
  end

  private
      def sign_in_required
          redirect_to new_user_session_url unless user_signed_in?
      end



end
