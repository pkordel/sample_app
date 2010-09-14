# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

begin
  require "gettext_i18n_rails/tasks"
rescue LoadError
  puts "gettext_i18n_rails is not installed, you probably should run 'rake gems:install' or 'bundle install'."
end

SampleApp::Application.load_tasks
