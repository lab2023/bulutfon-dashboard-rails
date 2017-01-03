require_dependency 'bulutfon_dashboard/application_controller'

module BulutfonDashboard
  class DashboardsController < ApplicationController
    add_breadcrumb 'Bulutfon', BulutfonDashboard::Engine.routes.url_helpers.root_path

    def index
      @details = @bulutfon.details
      @content_count = 5
      cdrs_open_struct = @bulutfon.cdrs.all({page: 1, limit: @content_count}).to_obj
      @cdrs = cdrs_open_struct.cdrs
      @user = ApiUser.new(@details)
    end
  end
end
