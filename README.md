# RCQRS Rails 3 Plugin

Use the [RCQRS](https://github.com/slashdotdash/rcqrs) library in your Rails 3 web app.

## Usage

Add the following dependencies to your Rails app's Gemfile and then `sudo bundle install`

    gem "uuidtools"
    gem "yajl-ruby", :require => 'yajl'
    gem "eventful"
    gem "rcqrs"
    gem "rcqrs-rails"

Add the following configuration within file `config/application.rb`.

    config.autoload_paths += %W(
      #{config.root}/app/commands
      #{config.root}/app/commands/handlers
      #{config.root}/app/domain
      #{config.root}/app/events
      #{config.root}/app/events/handlers
      #{config.root}/app/validators
    )

Add the following snippet inside `application_controller.rb` (ensuring it is `protected`) to allow each of your controllers to publish commands.

    def publish(command)
      Rcqrs::Gateway.publish(command)
    end

Create a yaml config file with your event storage configuration named `config/event_storage.yml` (or copy the example in `example/event_storage.yml`).

##Generators

This plugin provides three generators to ease common tasks for generating commands, events and controllers using the CQRS pattern.

* rcqrs:command
* rcqrs:controller
* rcqrs:event

Usage is `rails generate rcqrs:command <command name>`