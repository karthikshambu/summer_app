source 'https://rubygems.org'

gem 'rails', '3.2.12'
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

gem 'exotel' , :git => 'git@github.com:raudra/exotel.git'
gem 'i18n', '0.6.11'
gem "httparty", '0.11.0'
gem "highline", '1.6.21'
gem 'settingslogic'
gem 'delayed_job_active_record'
gem 'ruby-oci8', '~> 2.1.8'
gem 'activerecord-oracle_enhanced-adapter', "1.4.1"

gem 'jquery-rails'

group :development, :test do
  gem "capistrano","2.14.2"
  gem "capistrano-ext"
  # gem "rspec-rails", "~> 2.6"
  gem 'spork', '~> 1.0rc'
  gem 'shoulda-matchers'
  # gem "factory_girl", "2.2.0"
  # gem "factory_girl_rails", "1.3.0"
  # gem "rspec-http"
  # gem 'database_cleaner', git: 'git@github.com:bmabey/database_cleaner.git'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
end
