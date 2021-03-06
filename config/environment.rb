ENV['SINATRA_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load(".env.#{ENV['SINATRA_ENV']}")

require './config/initializers/modules.rb'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.schema_format = :sql

require_all 'config/initializers'
require_all 'app/uploaders'
require_all 'app'
require './app'
