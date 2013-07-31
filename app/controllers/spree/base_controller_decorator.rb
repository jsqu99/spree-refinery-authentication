# need this to unjack the decorator in spree_auth_devise (which undoes our engine's inclusion of the auth helpers module
Spree::BaseController.class_eval do
  # complete copy of what's in lib/spree/refinery_authentication_helpers
  def spree_current_user
    current_refinery_user
  end

  def spree_login_path
    refinery.new_refinery_user_session_path
  end

  def spree_signup_path
    refinery.new_refinery_user_registration_path
  end

  def spree_logout_path
    refinery.destroy_refinery_user_session_path
  end
end

