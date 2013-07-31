require "spree/refinery_authentication_helpers"


module SpreeRefineryAuthentication
  class Engine < Rails::Engine

    engine_name "spree_refinery_authentication"

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree.user_class = "Refinery::User"

      WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :per, :per_page
      WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :num_pages, :total_pages

      # critical! the new version will not be picked up unless you do this
      ApplicationController.send :include, Spree::RefineryAuthenticationHelpers
    end  

    config.to_prepare &method(:activate).to_proc

  end
end
