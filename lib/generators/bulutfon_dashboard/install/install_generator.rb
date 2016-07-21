require 'rails/generators/migration'

module BulutfonDashboard
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      def run_other_generators
        generate 'bulutfon_dashboard:assets'
        generate 'bulutfon_dashboard:initializers'
        generate 'bulutfon_dashboard:migrations'
        generate 'bulutfon_dashboard:controllers'
        generate 'bulutfon_dashboard:views'
      end

    end
  end
end