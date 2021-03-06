require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ignition_sequence_start"

    use Rack::Flash
  end

  get '/' do 
    if logged_in?
      redirect to '/items'
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def normalize_name(name)
        name.split.collect do |word|
          word.capitalize
        end.join(" ")
    end
  end
end