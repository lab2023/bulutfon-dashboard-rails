require_dependency 'bulutfon_dashboard/application_controller'

module BulutfonDashboard
  class DashboardsController < ApplicationController
    add_breadcrumb 'Bulutfon', BulutfonDashboard::Engine.routes.url_helpers.root_path

    def index
      @details = @bulutfon.details.to_obj
      @user = @details.user
      @credit = @details.credit
      @pbx = @details.pbx
    end
  end
end
