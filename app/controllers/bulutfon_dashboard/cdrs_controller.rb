require_dependency 'bulutfon_dashboard/application_controller'

module BulutfonDashboard
  class CdrsController < ApplicationController
    before_action :set_cdr, only: :show
    add_breadcrumb 'Bulutfon', BulutfonDashboard::Engine.routes.url_helpers.cdrs_path
    def index
      cdr_obj = @bulutfon.cdrs.all.to_obj
      @cdrs = cdr_obj.cdrs
      @pagination = cdr_obj.pagination
    end
    def show
      add_breadcrumb @cdr.uuid, BulutfonDashboard::Engine.routes.url_helpers.cdr_path(@cdr.uuid)
    end

    private
    def set_cdr
      cdr_hash = @bulutfon.cdrs.get(params[:id])['cdr']
      @cdr = BulutfonDashboard::Cdr.new(cdr_hash)
    end
  end
end
