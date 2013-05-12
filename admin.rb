require 'sinatra/base'
require 'erb'

require './admin/helpers'

module Admin
  class Server < Sinatra::Base
    # basic auth
    use Rack::Auth::Basic do |username, password|
      username == 'admin' && password == 'admin'
    end

    # set directorys
    configure do
      dir = File.dirname(File.expand_path(__FILE__))
      set :views,  "#{dir}/admin/views"
      set :public_folder, "#{dir}/admin/public"
      # response to the js or css request
      set :static, true
    end

    # helpers
    helpers Helpers
    # routes
    get '/' do 
      erb :index
    end
  end
end
