class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_users_path
      when User
        users_my_page_path
    end
  end
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
  

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_path
    else
      root_path
    end
  end
  
end
