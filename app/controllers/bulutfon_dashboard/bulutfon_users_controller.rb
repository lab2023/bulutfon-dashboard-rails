require_dependency 'bulutfon_dashboard/application_controller'

module BulutfonDashboard
  class BulutfonUsersController < ApplicationController
    skip_before_action :set_bulutfon
    before_action :set_resource, only: [:new, :show, :edit, :update, :destroy]
    add_breadcrumb 'Bulutfon', BulutfonDashboard::Engine.routes.url_helpers.root_path
    add_breadcrumb I18n.t('activerecord.models.bulutfon_user'), BulutfonDashboard::Engine.routes.url_helpers.bulutfon_users_path

    def show
    end

    def new
      add_breadcrumb t('view.new'), BulutfonDashboard::Engine.routes.url_helpers.new_bulutfon_users_path
      if @resource.present?
        redirect_to edit_bulutfon_users_path
        return
      end
      @resource = BulutfonUser.new
    end

    def edit
      add_breadcrumb t('view.edit'), BulutfonDashboard::Engine.routes.url_helpers.edit_bulutfon_users_path
    end

    def update
      if @resource.update(bulutfon_user_params)
        redirect_to bulutfon_users_path
      else
        render :edit
      end
    end

    def create
      @resource = BulutfonUser.new(bulutfon_user_params)
      @resource.user_id = BulutfonDashboard.current_user.id
      if @resource.save
        begin
          bulutfon = BulutfonSDK::REST::Bulutfon.new(@resource.api_token)
          bulutfon.details
        rescue BulutfonSDK::REST::RequestError
          @resource.destroy
          flash[:danger] = 'Geçersiz bir api anahtarı girdiniz.'
          redirect_to new_bulutfon_users_path
          return
        end
        redirect_to bulutfon_users_path
      else
        render :new
      end
    end

    def destroy
      @resource.destroy
      redirect_to bulutfon_users_path
    end
    private

    def set_resource
      @resource = BulutfonUser.find_by(user_id: BulutfonDashboard.current_user.id)
    end

    def bulutfon_user_params
      params.require(:bulutfon_user).permit(:api_token)
    end

  end
end
