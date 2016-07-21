require 'rails/generators/base'

module BulutfonDashboard
  module Generators
    class ControllersGenerator < Rails::Generators::Base
      CONTROLLERS = %w(base).freeze

      desc ''

      source_root File.expand_path('../../templates/controllers', __FILE__)
      class_option :controllers, aliases: "-c", type: :array,
                   desc: "Select specific controllers to generate (#{CONTROLLERS.join(', ')})"

      def create_controllers
        scope = 'bulutfon_dashboard'
        controllers = options[:controllers] || CONTROLLERS
        controllers.each do |name|
          template "#{name}_controller.rb",
                   "app/controllers/#{scope}/#{name}_controller.rb"
        end
      end
    end
  end
end