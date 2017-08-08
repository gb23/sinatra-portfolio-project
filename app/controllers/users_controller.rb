class UsersController < ApplicationController
    get '/users/login' do
        erb :'users/login'
    end

    get '/users/create_user' do
        erb :'users/create_user'
    end

    post '/users/create_user' do
binding.pry
        user = User.new(username: params[:name], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        if user.save  #only true if user has typed in password.  If blank, won't be true
            #!User.all.find {|usr| usr == user} && 
            #add this back to line above
            session[:user_id] = user.id
            redirect to '/fridges/new'          
        else
            erb :'users/failure'
        end
    end

    post '/users/login' do
        user = User.find_by(username: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/items'
        else
binding.pry
            erb :'users/failure'
        end
    end

  
end