# rails-template

A rails [application template](http://guides.rubyonrails.org/rails_application_templates.html) for web apps.

## Usage

```ruby
rails new [app_name] --skip-test-unit -m https://raw.githubusercontent.com/zacharywelch/rails-template/master/template.rb
```

## What it does

1. Adds the following gems
  - [jbuilder](https://github.com/rails/jbuilder)
  - [faker](https://github.com/stympy/faker)
  - [kaminari](https://github.com/amatsuda/kaminari)
  - [annotate](https://github.com/ctran/annotate_models)
  - [rspec-rails](https://github.com/rspec/rspec-rails)
  - [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
  - [byebug](https://github.com/deivid-rodriguez/byebug)
  - [okcomputer](https://github.com/sportngin/okcomputer)
  - [codeclimate-test-reporter](https://github.com/codeclimate/ruby-test-reporter)

2. Runs `bundle`

3. Runs the following generators
  - `rspec:install`

4. Configures rspec to exclude view, route, and controller specs

5. Configures New Relic

6. Configures Code Climate

7. Creates sample config files and git ignores the original ones
  - config/database.yml
  - config/secrets.yml

8. Replaces README with markdown

9. Customizes .gitignore file

10. Creates initial github commit

## Additional steps

### Code Climate
Replace the badge placeholders in `README.md` with the markdown snippets from Code Climate.

### TeamCity
Replace the badge placeholders in `README.md` with the markdown snippets from TeamCity.
