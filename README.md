# rails-template

A rails [application template](http://guides.rubyonrails.org/rails_application_templates.html) for web apps.

## Usage

```ruby
rails new [app_name] --skip-test-unit -m https://raw.githubusercontent.com/zacharywelch/rails-template/master/template.rb
```

## What it does

1. Adds the following gems
  - [faker](https://github.com/stympy/faker)
  - [kaminari](https://github.com/amatsuda/kaminari)
  - [annotate](https://github.com/ctran/annotate_models)
  - [rspec-rails](https://github.com/rspec/rspec-rails)
  - [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
  - [byebug](https://github.com/deivid-rodriguez/byebug)
  - [capistrano](https://github.com/capistrano/capistrano)
  - [capistrano-rvm](https://github.com/capistrano/rvm)
  - [capistrano-bundler](https://github.com/capistrano/bundler)
  - [solano](https://github.com/solanolabs/solano)

2. Runs `bundle`

3. Runs the following generators
  - `rspec:install`
  - `cap install`

4. Configures rspec to exclude view, route, and controller specs

5. Configures New Relic

6. Configures Solano

7. Configures Capistrano

8. Creates sample config files and git ignores the original ones
  - config/database.yml
  - config/secrets.yml

9. Replaces README with markdown

10. Customizes .gitignore file

11. Creates initial github commit
