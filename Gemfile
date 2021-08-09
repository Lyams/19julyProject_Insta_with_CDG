source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'bootstrap', '~> 5.0.1'
gem 'devise', '~> 4.8'
gem 'pundit'
gem 'shrine', '~> 3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
gem 'spring'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # gem 'database_cleaner-redis'
  gem 'faker', '~> 2.18'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end
group :test do
  # Capybara helps you test web applications by simulating how a real user would interact with your app
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  # BDD for Ruby-On-Rails
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rails-controller-testing'
  # Run Selenium tests more easily with install and updates for all supported webdrivers.
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers', '~> 4.6'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
