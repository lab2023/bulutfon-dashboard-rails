module BulutfonDashboard
  class ApplicationController < BaseController

    protect_from_forgery with: :exception
    before_action :check_current_user, :set_bulutfon
    layout BulutfonDashboard.layout || 'application'

    private
    def check_current_user
      @current_user = BulutfonDashboard.current_user
      unless @current_user.present?
        redirect_to main_app.root_path
        return
      end
    end

    def set_bulutfon
      @token = BulutfonDashboard::BulutfonUser.find_by(user_id: @current_user.id)

      unless @token.present?
        redirect_to bulutfon_users_path
        return
      end

      @bulutfon = BulutfonSDK::REST::Bulutfon.new(@token.api_token)
    end
  end
end
