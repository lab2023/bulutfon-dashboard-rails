require_dependency 'bulutfon_dashboard/application_controller'

module BulutfonDashboard
  class DashboardsController < ApplicationController
    add_breadcrumb 'Bulutfon', BulutfonDashboard::Engine.routes.url_helpers.root_path

    def index
      @details = @bulutfon.details
      @user = ApiUser.new(@details)
    end
  end
end
