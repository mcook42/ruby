# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Setup

`bundle install` will install the dependencies needed to work with the application

## Run

`bin/rails server` will start up the server and serve traffic on http://localhost:3000

## Helpful scripts

- `bin/rails generate controller [DOMAIN NAME like Articles] [ACTION NAME]` will create a controller and route for the action provided
- `bin/rails generate model Article title:string body:text` will create resources to support an Article model

## Structure

| File/Folder  | Purpose                                                                                                                                                                        |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| app/         | Contains the controllers, models, views, helpers, mailers, channels, jobs, and assets for your application.                                                                    |
| bin/         | Contains the `rails` script that starts the app and can contain other scripts you use to setup, update, deploy, or run the app                                                 |
| config/      | Contains configuration for the app's routes, database, and more                                                                                                                |
| config.ru    | Rack configuration for Rack-based servers used to start the app                                                                                                                |
| db/          | Contains the current database schema and the database migrations                                                                                                               |
| lib/         | Extended modules for the application                                                                                                                                           |
| log/         | App log files                                                                                                                                                                  |
| public/      | Contains the static files and compiled assets. Exposed as-is when the app is running                                                                                           |
| Rakefile     | This file locates and loads tss that can be run from the cli. The tasks are defined throughout the Rails components. To add functionality, add files to the `lib/tasks` folder |
| storage/     | Active Storage files for Disk Service                                                                                                                                          |
| test/        | Unit tests, fixtures, and other test apparatus                                                                                                                                 |
| tmp/         | Temporary files like cache and pid files                                                                                                                                       | 
| vendor/      | A place for all third-party code. In a typical rails app this includes vendored gems                                                                                           |


### Under the hood

| Technology | Purpose                                                                                                                                                                      |
|------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Puma       | A web server distributed with Rails by default. [Documentation](https://github.com/puma/puma)                                                                                |
| SQLite3    | A C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL Database engine. [Documentation](https://www.sqlite.org/index.html) |


### Notes

- Rails applications do not use require to load application code. DO NOT use `require`. App classes and modules are available everywhere,
you do not need to and should not load anything under `app/` with `require`.  This feature is called [_autoloading_](https://guides.rubyonrails.org/autoloading_and_reloading_constants.html)
- The only times to use `require` are 1) to load files under the `lib/` directory and 2) to load gem dependencies that have `require: false` in the `Gemfile`
- In ERB, a templating system that evluates Ruby code embedded in a document, there are two similar types of ERB tags: `<% %>`
which means "evaluate the enclosed Ruby code" and `<%= %>` which means "evaluate the enclosed Ruby code and output the value it returns"