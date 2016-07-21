require 'rails/generators/base'

module BulutfonDashboard
  module Generators
    class HelpersGenerator < Rails::Generators::Base
      HELPERS = %w(application).freeze

      desc ''

      source_root File.expand_path('../../templates/helpers', __FILE__)
      class_option :controllers, aliases: "-c", type: :array,
                   desc: "Select specific helpers to generate (#{HELPERS.join(', ')})"

      def create_helpers
        scope = 'bulutfon_dashboard'
        controllers = options[:helpers] || HELPERS
        controllers.each do |name|
          template "#{name}_helper.rb",
                   "app/helpers/#{scope}/#{name}_helper.rb"
        end
      end
    end
  end
end