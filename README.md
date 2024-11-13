# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.2
* Rails 7.0.8.6

* Creación de database:
rails generate scaffold Ingredient name:string
rails generate scaffold Recipe name:string number_people:integer description:text
rails generate scaffold Trip title:string start_date:datetime end_date:datetime

* User con devise
gem 'devise'
rails generate devise:install
rails generate devise User first_name:string

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
