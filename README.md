# rails-template

A rails [application template](http://guides.rubyonrails.org/rails_application_templates.html) for web apps.

## Usage

```ruby
rails new [app_name] --skip-test-unit -m https://raw.githubusercontent.com/zacharywelch/rails-template/master/template.rb
```

## What it does

1. Adds the following gems
  - [rails](https://github.com/rails/rails)
  - [jbuilder](https://github.com/rails/jbuilder)
  - [sass-rails](https://github.com/rails/sass-rail://github.com/rails/sass-rails)
  - [uglifier](https://github.com/lautis/uglifier)
  - [coffee-rails](https://github.com/rails/coffee-rails)
  - [jquery-rails](https://github.com/rails/jquery-rails)
  - [turbolinks](https://github.com/turbolinks/turbolinks)
  - [sdoc](https://github.com/zzak/sdoc)
  - [web-console](https://github.com/rails/web-console)
  - [faker](https://github.com/stympy/faker)
  - [kaminari](https://github.com/amatsuda/kaminari)
  - [spring](https://github.com/rails/spring)
  - [sqlite3](https://github.com/sparklemotion/sqlite3-ruby)
  - [activerecord-sqlserver-adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter)
  - [tiny_tds](https://github.com/rails-sqlserver/tiny_tds)
  - [annotate](https://github.com/ctran/annotate_models)
  - [rspec-rails](https://github.com/rspec/rspec-rails)
  - [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
  - [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
  - [simplecov](https://github.com/colszowka/simplecov)
  - [codeclimate-test-reporter](https://github.com/codeclimate/ruby-test-reporter)
  - [newrelic_rpm](https://github.com/newrelic/rpm)
  - [exception_notification](https://github.com/smartinez87/exception_notification)
  - [byebug](https://github.com/deivid-rodriguez/byebug)
  - [okcomputer](https://github.com/sportngin/okcomputer)
  - [lograge](https://github.com/roidrage/lograge)
  - [fluentd](https://github.com/fluent/fluentd)
  - [fluent-plugin-record-modifier](https://github.com/repeatedly/fluent-plugin-record-modifier)

2. Runs `bundle`

3. Runs the following generators
  - `rspec:install`

4. Configures rspec to exclude view, route, and controller specs

5. Configures New Relic

6. Configures Code Climate

7. Configures lograge and fluentd, to be consummed from Sumo Logic

8. Creates sample config files and git ignores the original ones
  - config/database.yml
  - config/secrets.yml

9. Replaces README with markdown

10. Customizes .gitignore file

11. Creates initial github commit

## Additional steps

### Code Climate
Replace the badge placeholders in `README.md` with the markdown snippets from Code Climate.

### TeamCity
Replace the badge placeholders in `README.md` with the markdown snippets from TeamCity.
