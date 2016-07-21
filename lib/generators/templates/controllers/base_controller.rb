module BulutfonDashboard
  class BaseController < ActionController::Base
    before_action :set_credentials

    def set_credentials
      BulutfonDashboard.current_user = '' # current_user
    end
  end
end