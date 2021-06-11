source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails", github: "rails/rails", branch: "main"
gem "puma", "~> 5.3.1"
gem "sass-rails", ">= 6"
gem "bootstrap-sass"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.4", require: false
gem "bcrypt", "~> 3.1.7"
gem "nokogiri", ">= 1.11.4"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"


group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "rack-mini-profiler", "~> 2.0"
  gem "rubocop", ">= 0.90", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "listen", "~> 3.3"
  gem "spring"
  gem "spring-watcher-listen"
  gem "web-console", github: "rails/web-console"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rails-controller-testing"
  gem "minitest"
  gem "minitest-reporters"
  gem "guard"
  gem "guard-minitest"
end

group :production do
  gem "pg", "1.2.3"
end
