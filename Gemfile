source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Manage pictures upload
gem 'paperclip', '~> 5.0.0'

# Use haml for templates
gem 'haml'
# Allows to use markdown filter in haml files
gem 'redcarpet'

# Use settings.yml
gem 'config'

# To convert date to string containing Japanese era
gem 'era_ja'

# To make pdf files
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# To make docx files
gem 'htmltoword'

# Bootstrap CSS framework
gem 'bootstrap-sass', '~> 3.3.6'
# Use vue's JS framework
gem 'lodash-rails'
gem 'vuejs-rails'

# Document your API with Swagger
gem 'swagger-blocks'

# Translate model's field with globalize
# TODO: update to the stable release when it is released officially for rails 5
gem 'globalize', github: 'globalize/globalize'

# Use draper for decorators
gem 'draper', github: 'drapergem/draper'

group :development, :test do
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger
  # console
  gem 'pry-rails'
  gem 'pry-doc' # rubocop:disable Bundler/OrderedGems
  gem 'pry-remote'
  gem 'pry-nav' # rubocop:disable Bundler/OrderedGems

  # Linters
  gem 'haml_lint'
  gem 'rubocop', github: 'bbatsov/rubocop', ref: '2409f1c'

  # Javascript test framework
  gem 'magic_lamp'
  gem 'phantomjs'
  gem 'teaspoon-jasmine'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  # in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Get schema info with 'annotate'
  gem 'annotate'

  # Monitor queries to avoid N+1 query issues
  gem 'bullet'

  # Haml generator
  gem 'haml-rails'
end

group :test do
  # Compute test coverage
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
