module BulutfonDashboard::ApplicationHelper
  def bulutfon_dashboard
    BulutfonDashboard::Engine.routes.url_helpers
  end
end