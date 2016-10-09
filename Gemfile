# source 'https://rubygems.org'
source 'https://gems.ruby-china.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

#############################################################################################################
# Annotate Rails classes with schema and routes info
# Read more: https://github.com/ctran/annotate_models
# Running: rails g annotate:install
gem 'annotate' 
# A set of Rails responders to dry up your application
# Read more: https://github.com/plataformatec/responders
# Running: rails g responders:install
gem "responders"
# API, command and message handling for WeChat in Rails
# Read more: https://github.com/Eric-Guo/wechat
gem 'wechat'
# An unofficial simple wechat pay gem
# https://github.com/jasl/wx_pay
gem 'wx_pay'
# Simple Rails app configuration
# Read more: https://github.com/laserlemon/figaro
gem "figaro"
############################################################################################################

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
