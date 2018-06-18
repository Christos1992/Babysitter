class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?
   
   def after_sign_in_path_for(resource)
    p " sign up "
     edit_parent_path(current_user.render_what_i_am.id)
        #redirect_to 
    end
   # def check_profile
      #  current_user.render_what_i_am.last_name.nil? 

   # end
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_parent])

    # For additional in app/views/devise/registrations/edit.html.erb
 #    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
