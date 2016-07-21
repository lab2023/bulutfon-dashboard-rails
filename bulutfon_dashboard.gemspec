$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'bulutfon_dashboard/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'bulutfon_dashboard'
  s.version     = BulutfonDashboard::VERSION
  s.authors     = ['hamit.turku.kaya']
  s.email       = ['hamit.turku.kaya@bulutfon.com', 'dev@bulutfon.com']
  s.homepage    = 'https://www.bulutfon.com'
  s.summary     = 'Bulutfon Dashboard.'
  s.description = 'Bulutfon Dashboard.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.0'
  s.add_dependency 'bulutfon_sdk', '~> 1.3.0'
  #
  # s.add_development_dependency 'sqlite3'
end
