module Spree
  module RefineryAuthenticationHelpers
    def self.included(receiver)

      # ensure refinery_user? helper method is always available
      receiver.send :helper_method, :refinery_user?
    end

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
end
