class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        if customer_signed_in?
             customer_path(resource)
        else admin_sign_in?
          admin_root_path
        end
    end
    
    def after_sign_out_path_for(resource)
        if customer_signed_out?
            root_path(resource)
        else admin_sign_out?
            new_admin_session_path
        end
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end
end
