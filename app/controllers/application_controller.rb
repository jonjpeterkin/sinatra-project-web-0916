require "rack-flash"

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  use Rack::Flash
  set(:views, 'app/views')

  get "/?" do
    redirect to "/users/signin"
  end


end
