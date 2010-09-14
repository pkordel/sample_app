source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem "fast_gettext", '>= 0.5.8'
gem 'gettext_i18n_rails'

#only used for mo/po file generation in development, !do not load(:lib=>false)! since it will only eat 7mb ram
gem "gettext", '>= 1.9.3', :require => false

#this is needed for language/country translations
gem "i18n_data", '>= 0.2.6', :require => 'i18n_data'

gem 'ruby_parser'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'webrat'
end

group :development do
  gem 'rspec-rails', '2.0.0.beta.20'
end

group :test do
  gem 'rspec', '2.0.0.beta.20'
  gem 'autotest', '4.3.2'
  gem 'autotest-rails', '4.1.0'
  gem 'autotest-fsevent', '0.2.3'
  gem 'autotest-growl', '0.2.5'
  gem 'spork', '0.8.4'
end
