# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Setup

`bundle install` will install the dependencies needed to work with the application

## Run

`bin/rails server` will start up the server and serve traffic on http://localhost:3000

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
