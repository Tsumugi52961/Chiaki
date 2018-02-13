require 'sinatra'
require 'sinatra/reloader' if development?
require 'sequel'
require 'json'
require 'sequel/plugins/serialization'

Sequel.sqlite("./db/#{development? ? 'development' : 'production'}.sqlite3")
Sequel::Model.plugin :json_serializer

Dir["./models/*.rb"].each do |file|
  require file
end

configure do
  set :show_exceptions, :after_handler
  set :raise_errors, false
end

# routes
get '/' do
  '/'
end

get '/ping' do
  'pong'
end

get '/bangumis' do
  Bangumi.reverse_order(:id).limit(10).to_json
end

post '/bangumis' do
  valid_keys = %w[title classifcation link uploaded_at magnet_link]
  bangumi = Bangumi.new(params.select { |k, v| valid_keys.include?(k) } )
  halt(400, bangumi.errors.full_messages.join(', ')) unless bangumi.valid?
  bangumi.save
  "OK"
end

error do
  env['sinatra.error'].message
end

