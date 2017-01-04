module BulutfonDashboard
  class Engine < ::Rails::Engine
    isolate_namespace BulutfonDashboard
    engine_name 'bulutfon_dashboard'

    initializer 'BulutfonDashboard precompile hook', group: :all do |app|
      app.config.assets.precompile += %w(
        bulutfon_dashboard/bulutfon-fonts.css
      )
    end

  end
end
