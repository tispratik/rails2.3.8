require File.join(File.dirname(__FILE__), 'lib/rails', 'version')

PKG_BUILD       = ENV['PKG_BUILD'] ? '.' + ENV['PKG_BUILD'] : ''
PKG_NAME        = 'rails'
PKG_VERSION     = Rails::VERSION::STRING + PKG_BUILD
PKG_FILE_NAME   = "#{PKG_NAME}-#{PKG_VERSION}"
PKG_DESTINATION = ENV["RAILS_PKG_DESTINATION"] || "../#{PKG_NAME}"
RELEASE_NAME  = "REL #{PKG_VERSION}"
RUBY_FORGE_PROJECT = "rails"
RUBY_FORGE_USER    = "webster132"
BASE_DIRS = %w( 
  app
  config/environments
  config/initializers
  config/locales
  db
  doc
  log
  lib
  lib/tasks
  public
  script
  script/performance
  test
  vendor
  vendor/plugins
  tmp/sessions
  tmp/cache
  tmp/sockets
  tmp/pids
)

APP_DIRS    = %w( models controllers helpers views views/layouts )
PUBLIC_DIRS = %w( images javascripts stylesheets )
TEST_DIRS   = %w( fixtures unit functional mocks mocks/development mocks/test )

LOG_FILES    = %w( server.log development.log test.log production.log )
HTML_FILES   = %w( 422.html 404.html 500.html index.html robots.txt favicon.ico images/rails.png
                   javascripts/prototype.js javascripts/application.js
                   javascripts/effects.js javascripts/dragdrop.js javascripts/controls.js )
BIN_FILES    = %w( about console destroy generate performance/benchmarker performance/profiler runner server plugin )

VENDOR_LIBS = %w( actionpack activerecord actionmailer activesupport activeresource railties )


Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'rails'
  s.version = PKG_VERSION
  s.summary = "Web-application framework with template engine, control-flow layer, and ORM."
  s.description = <<-EOF
    Rails is a framework for building web-application using CGI, FCGI, mod_ruby, or WEBrick
    on top of either MySQL, PostgreSQL, SQLite, DB2, SQL Server, or Oracle with eRuby- or Builder-based templates.
  EOF

  s.add_dependency('rake', '>= 0.8.3')
  s.add_dependency('activesupport',    '= 2.3.8' + PKG_BUILD)
  s.add_dependency('activerecord',     '= 2.3.8' + PKG_BUILD)
  s.add_dependency('actionpack',       '= 2.3.8' + PKG_BUILD)
  s.add_dependency('actionmailer',     '= 2.3.8' + PKG_BUILD)
  s.add_dependency('activeresource',   '= 2.3.8' + PKG_BUILD)

  s.rdoc_options << '--exclude' << '.'
  s.has_rdoc = false

  s.require_path = 'lib'
  s.bindir = "bin"                               # Use these for applications.
  s.executables = ["rails"]
  s.default_executable = "rails"

  s.author = "David Heinemeier Hansson"
  s.email = "david@loudthinking.com"
  s.homepage = "http://www.rubyonrails.org"
  s.rubyforge_project = "rails"
end
