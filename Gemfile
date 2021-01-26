source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# CORE
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

# AUTH
gem 'devise_token_auth'

# ENVS
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
