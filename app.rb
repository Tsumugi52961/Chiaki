require 'sinatra'
require 'sinatra/reloader' if development?
require 'sequel'

Sequel.sqlite("./db/#{development? ? 'development' : 'production'}.sqlite3")

Dir["./models/*.rb"].each do |file|
  require file
end

# routes
get '/' do
  '/'
end

get '/ping' do
  'pong'
end

get '/bangumis' do
  Bangumi.to_s
end

