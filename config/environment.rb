require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

# require 'yelp'

# Yelp.client.configure do |config|
#   config.consumer_key = ''
#   config.consumer_secret = ''
#   config.token = ''
#   config.token_secret = ''
# end
