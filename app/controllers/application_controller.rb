class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate!

    def authenticate!
      if admin_signed_in?
        authenticate_admin!
      else
        authenticate_customer!
      end
    end
    
    def after_sign_in_path_for(resource)
        if customer_signed_in?
             customer_path(resource)
        else admin_sign_in?
          admin_root_path
        end
    end
    
    def after_sign_out_path_for(resource)
            root_path(resource)
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end
    
    
end
