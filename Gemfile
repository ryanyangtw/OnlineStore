source 'https://rubygems.org'
ruby "2.1.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


#customize gem
#gem 'pry', '~> 0.10.0'

gem "simple_form", "3.1.0rc1"
gem 'bootstrap-sass', '~> 3.2.0.0'
#The bootstrap-sass-rails gem is deprecated starting with version 3.1.0.0.
#gem 'bootstrap-sass-rails', '~> 3.1.0.0'

gem 'devise' , '~> 3.2'
gem 'carrierwave'
gem 'fog'
gem 'mini_magick', '~> 3.7.0'
gem 'cocoon', '~> 1.2.6'
gem 'settingslogic', '~> 2.0.9'
gem 'aasm', '~> 3.3.1'

gem 'stripe'
gem 'roadie'
#gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
gem 'ransack'

# add for snipper 
gem 'jquery-ui-rails', '~> 5.0.0'

# add for sidekiq
gem 'sidekiq', '~> 3.2.1'
gem 'sinatra', require: false
gem 'slim'

gem 'carrierwave-aws'


# Grape is a REST-like API micro-framework
gem 'grape'
gem 'kramdown'
gem 'grape-swagger'
#gem 'grape-swagger-rails'
gem 'grape-rabl'
# for grape mass assignment
#gem "hashie_rails"
gem "hashie-forbidden_attributes"
gem 'rabl-rails'


# Add pagination for grape api
gem 'will_paginate' , '~> 3.0'
gem 'will_paginate-bootstrap'
gem 'api-pagination'




# Parse
gem "parse-ruby-client"


gem "figaro"


#add for capistrano
# gem 'capistrano', '~> 3.2.0'
# gem 'capistrano-bundler', '~> 1.1.2'
# gem 'capistrano-rails', '~> 1.1.1'
# gem 'capistrano-rvm', github: "capistrano/rvm"
# gem 'capistrano-sidekiq' , github: 'seuros/capistrano-sidekiq'

#gem 'mysql2'

gem 'pg'

#add for seo
gem 'seo_helper', '~> 1.0', :git => 'git://github.com/techbang/seo_helper.git'
#gem 'sitemap_generator'

#fb open graph
gem 'open_graph_helper', :github => 'techbang/open_graph_helper'



# Add fot Hroku
group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  #gem 'pry-nav'   # Using MRI 2+? Switch to pry-byebug.
  gem 'pry-byebug'
  gem 'meta_request'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'guard-livereload'
  gem 'annotate', '~> 2.6.5'
  gem 'awesome_print', :require => false
  gem 'hirb', :require => false
  gem 'hirb-unicode', :require => false
end












