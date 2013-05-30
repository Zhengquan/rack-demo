require './app'
require './admin'

builder = Rack::Builder.new {
  use Rack::ETag
  # routes
  map '/' do 
    run App.new
  end
  map '/admin' do
     run Admin::Server.new
  end
}
run builder
