source 'https://rubygems.org'
ruby '2.3.0'
# JDavis: adding gemset designation for RVM.  Ignore the following line if not using RVM.
#ruby=2.3.0@email_affiliate_program

gem 'activeadmin', '1.0.0.pre2'
gem 'delayed_job_active_record', '~> 4.0.3'
gem 'devise'
gem 'pg'
gem 'rails', '4.2.5.2'
gem 'unicorn'
gem 'annotate', '2.6.8'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 4.1.0'
  gem 'sass-rails',   '~> 5.0.1'
  gem 'uglifier'
end

group :development do
  gem 'annotate', '2.6.8'         # JDavis: puts the model schema in the model file.
  gem 'letter_opener', '1.4.0'    # JDavis: view emails in your browser.
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '3.4.2'
  gem 'rspec-mocks', '3.4.1'
  gem 'test-unit', '~> 3.0'
  gem "dotenv-rails"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
end
