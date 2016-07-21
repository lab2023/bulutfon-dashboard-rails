gem 'bulutfon_dashboard', git: 'https://github.com/lab2023/bulutfon-dashboard-rails.git', branch: 'master'

rails generate bulutfon_dashboard:assets //required
rails generate bulutfon_dashboard:initializers //required
rails generate bulutfon_dashboard:helpers //required
rails generate bulutfon_dashboard:migrations //required
rails generate bulutfon_dashboard:controllers //required
rails generate bulutfon_dashboard:views

mount BulutfonDashboard::Engine => '/bulutfon', as: 'bulutfon_dashboard'

bulutfon_engine.root_path