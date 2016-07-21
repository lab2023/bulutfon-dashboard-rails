require 'rails/generators/base'

module BulutfonDashboard
  module Generators
    module ViewPathTemplates #:nodoc:
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
        view_directory :cdrs
        view_directory :dashboards
        view_directory :bulutfon_users
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}" do |content|
          content
        end
      end

      def target_path
        @target_path ||= "app/views/#{plural_scope || :bulutfon_dashboard}"
      end

      def plural_scope
        @plural_scope ||= scope.presence && scope.underscore.pluralize
      end
    end

    class ViewsGenerator < Rails::Generators::Base
      include ViewPathTemplates
      source_root File.expand_path('../../../../app/views/bulutfon_dashboard', __FILE__)
      desc 'Copies Bulutfon Dashboard views to your application.'
      def copy_views
        view_directory :cdrs
        view_directory :dashboards
        view_directory :bulutfon_users
      end
    end
  end
end