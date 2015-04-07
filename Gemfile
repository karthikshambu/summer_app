source 'https://rubygems.org'

gem 'rails', '3.2.12'
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'exotel' , :git => 'git@github.com:raudra/exotel.git'
gem 'i18n', '0.6.11'
gem "httparty", '0.11.0'
gem "highline", '1.6.21'
gem 'settingslogic'
gem 'delayed_job_active_record'


# Gems used only for assets and not required
# in production environments by default.
# group :assets do
#   gem 'sass-rails',   '~> 3.2.3'
#   gem 'coffee-rails', '~> 3.2.1'

#   # See https://github.com/sstephenson/execjs#readme for more supported runtimes
#   # gem 'therubyracer', :platforms => :ruby

#   gem 'uglifier', '>= 1.0.3'
# end

gem 'jquery-rails'

group :development, :test do
  gem "capistrano","2.14.2"
  gem "capistrano-ext"
  gem "rspec-rails", "~> 2.6"
  gem 'spork', '~> 1.0rc'
  gem 'shoulda-matchers'
  gem "factory_girl", "2.2.0"
  gem "factory_girl_rails", "1.3.0"
  gem "rspec-http"
  gem 'database_cleaner', git: 'git@github.com:bmabey/database_cleaner.git'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
