source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem 'meta-tags'
gem 'any_login'

gem 'friendly_id', '~> 5.4.0'

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'inline_svg'

gem "turbo-rails"

gem "stimulus-rails"

gem "tailwindcss-rails"
gem "tailwindcss_merger", "~> 0.2.1"

gem "jbuilder"

gem "carrierwave"

gem 'mini_magick'

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Sass to process CSS
gem "sass-rails", ">= 6"

gem 'devise'

gem 'simple_form'
gem 'simple_form-tailwind'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem 'rails-controller-testing'
  gem "faker"
end

group :development do
  gem "web-console"
  gem 'listen'
  gem 'spring'
  gem 'capistrano'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
  gem 'capistrano-yarn'
  gem 'capistrano-sidekiq', '2.0.0'
  gem 'capistrano-secrets-yml', '~> 1.2.1'
  gem 'capistrano-rails-tail-log'
  gem 'capistrano-local-precompile', '~> 1.2.0'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end
