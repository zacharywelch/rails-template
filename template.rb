@path = "https://raw.githubusercontent.com/zacharywelch/rails-template/master/templates"

remove_file 'README.rdoc'
get "#{@path}/README.md", 'README.md'
get "#{@path}/INSTALLATION.md", 'INSTALLATION.md'
get "#{@path}/CONTRIBUTING.md", 'CONTRIBUTING.md'
gsub_file 'README.md', /my_app_name/, @app_name
gsub_file 'INSTALLATION.md', /my_app_name/, @app_name
gsub_file 'CONTRIBUTING.md', /my_app_name/, @app_name

create_file 'config/database.yml.sample', File.read('config/database.yml')
create_file 'config/secrets.yml.sample', File.read('config/secrets.yml')

remove_file 'Gemfile'
create_file 'Gemfile'

add_source 'https://rubygems.org'

gem 'rails', '~> 4.2.5'
gem 'faker'
gem 'kaminari'
gem 'newrelic_rpm'
gem 'exception_notification'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'okcomputer'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'sdoc', '~> 0.4.0', group: :doc

append_to_file 'Gemfile', "\n\n\n"

gem_group :development do
  gem 'spring'
  gem 'annotate'
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
end

gem_group :test do
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 3.0'
  gem 'codeclimate-test-reporter', require: nil
end

gem_group :development, :staging, :production do
  gem 'tiny_tds', '~> 0.7.0'
  gem 'activerecord-sqlserver-adapter'
end

run 'bundle install'

generate 'rspec:install'

inject_into_file 'spec/rails_helper.rb',
  after: /require\s+['|"]rspec\/rails['|"]/ do <<-'RUBY'

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'simplecov'
SimpleCov.start
RUBY
end

inject_into_file 'config/application.rb',
                 after: /require\s+File.expand_path\(['|"]..\/boot['|"],\s+__FILE__\)/ do <<-'RUBY'

require 'ipaddr'
RUBY
end

inject_into_file 'config/application.rb',
                 after: /config.active_record.raise_in_transactional_callbacks = true/ do <<-'RUBY'


    # Only set localhost IPv4 and IPv6 as trusted proxies
    config.action_dispatch.trusted_proxies = %w(127.0.0.1 ::1).map { |proxy| IPAddr.new(proxy) }
RUBY
end

gsub_file 'spec/rails_helper.rb',
  %r{# Dir\[Rails\.root\.join\('spec/support/\*\*/\*\.rb'\)\]\.each { \|f\| require f }},
  "Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }"

get "#{@path}/spec/support/shoulda_helper.rb", 'spec/support/shoulda_helper.rb', force: true

get "#{@path}/.gitignore", '.gitignore', force: true

run "newrelic install --license_key='d445e66d0037c4d9dfe1eb38137ff88c0c606455' #{@app_name}"

get "#{@path}/.codeclimate.yml", '.codeclimate.yml'
get "#{@path}/config/.rubocop.yml", 'config/.rubocop.yml'
get "#{@path}/config/.eslintrc", 'config/.eslintrc'
get "#{@path}/config/.coffeelint.json", 'config/.coffeelint.json'

gsub_file "config/environments/production.rb", /:debug/, ':info'

get "#{@path}/config/initializers/activerecord_sql_adapter.rb", 'config/initializers/activerecord_sql_adapter.rb', force: true
get "#{@path}/config/initializers/okcomputer.rb", 'config/initializers/okcomputer.rb', force: true
get "#{@path}/config/initializers/exception_notification.rb", 'config/initializers/exception_notification.rb', force: true
get "#{@path}/config/initializers/remote_ip.rb", 'config/initializers/remote_ip.rb', force: true
gsub_file "config/initializers/exception_notification.rb", /my_app_name/, @app_name
gsub_file "config/environments/production.rb", /# config.action_mailer.raise_delivery_errors = false\n/, <<-'RUBY'
config.action_mailer.raise_delivery_errors = true

  # Uncomment the following configurations for smtp delivery method via gmail.
  # Add related user_name and password to config/secrets.yml
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            Rails.application.secrets.exception_email['user_name'],
    password:             Rails.application.secrets.exception_email['password'],
    authentication:       'login',
    enable_starttls_auto: true
  }
RUBY

gsub_file "config/environments/production.rb", /# Prepend all log lines with the following tags.\n/, ""
gsub_file "config/environments/production.rb", /# config\.log_tags = \[ :subdomain, :uuid \]\n/, ""

environment do <<-'RUBY'

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, routing_specs: false,
                               controller_specs: false
    end

    # Prepend all log lines with the following tags.
    config.log_tags = [:uuid,
                       :remote_ip,
                       lambda { |req| req.authorization.split(':').first if req.authorization }]
RUBY
end

create_file 'config/environments/staging.rb', File.read('config/environments/production.rb')

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
