class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      public_user_path(resource)
    else
      admin_item_images_path
    end
  end

  def after_sign_out_path_for(resource)
    if current_user
      new_admin_session_path
    else
      root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :sex])
  end

end
