source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
# gem 'bootstrap', '~> 5.0.1'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.8'
gem 'faker', '~> 2.18'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 6.1.4'
gem 'sass-rails', '>= 6'
gem 'shrine', '~> 3.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'spring', '~> 2.1', '>= 2.1.1'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers', '~> 4.6'
end

group :development do
  gem 'bullet', '~> 6.1', '>= 6.1.5'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
