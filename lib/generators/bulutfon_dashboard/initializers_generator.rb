require 'rails/generators/migration'

module BulutfonDashboard
  module Generators
    class InitializersGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../templates/initializers', __FILE__)
      desc 'add the initializers'

      def copy_migrations
        template 'bulutfon_dashboard.rb', 'config/initializers/bulutfon_dashboard.rb'
      end
    end
  end
end