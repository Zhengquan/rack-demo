require './app'
require './admin'

buidler = Rack::Builder.new {
  use Rack::ETag
  # routes
  map '/' do 
    run App.new
  end
  map '/admin' do
     run Admin::Server.new
  end
}

Rack::Handler::Thin.run buidler, :Port => ENV['port'] || 3000
