class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # raise
    # edit_parent_path(current_user.render_what_i_am.id)
    if current_user.is_parent
      edit_parent_path(current_user.render_what_i_am.id)
      '' # Or :prefix_to_your_route
    else
      edit_bbsitter_path(current_user.render_what_i_am.id)
    end
  end
end
