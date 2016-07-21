require 'rails/generators/base'

module BulutfonDashboard
  module Generators
    module AssetPathTemplates #:nodoc:
      extend ActiveSupport::Concern

      included do
        argument :scope, required: false, default: nil,
                 desc: "The scope to copy views to"

        public_task :copy_views
      end

      module ClassMethods
        def hide!
          Rails::Generators.hide_namespace self.namespace
        end
      end

      def copy_views
        view_directory :stylesheets
        view_directory :fonts
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path(name)}/#{name}" do |content|
          content
        end
      end

      def target_path(name)
        if name == :fonts
          @target_path = 'public/'
        else
          @target_path = 'vendor/assets/'
        end
      end

      def plural_scope
        @plural_scope ||= scope.presence && scope.underscore.pluralize
      end
    end

    class AssetsGenerator < Rails::Generators::Base
      include AssetPathTemplates
      source_root File.expand_path('../../templates/assets', __FILE__)
      desc 'Copies Bulutfon Dashboard views to your application.'
      def copy_views
        view_directory :stylesheets
        view_directory :fonts
      end
    end
  end
end