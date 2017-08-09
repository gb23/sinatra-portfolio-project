class UsersController < ApplicationController
    get '/users/login' do
        erb :'users/login'
    end



    get '/users/create_user' do
        erb :'users/create_user'
    end

    get '/users/logout' do
        if logged_in?
            session.destroy
            redirect to '/users/login'
        else
            redirect to '/'
        end
    end

    get '/users/:slug' do
        @user = User.select_by_slug(params[:slug]).first
        erb :'users/show_user'
    end

    post '/users/create_user' do
        user = User.new(username: params[:name], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        if user.save  #only true if user has typed in password.  If blank, won't be true
            #!User.all.find {|usr| usr == user} && 
            #add this back to line above
            session[:user_id] = user.id
            flash[:message] = "To get your account started, you'll need to create a Fridge and then add at least item to it."
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
            erb :'users/failure'
        end
    end

    helpers do
        def find_and_display_sharers(user)
            shared_hash = {}
            user.fridges.each do |fridge|
                shared_hash[fridge] = []
                fridge.users.each do |user|
                    shared_hash[fridge] << user
                end
            end
            shared_hash = eliminate_self(shared_hash, user)
            display_shared(shared_hash)
        end

        def eliminate_self(shared_hash, user)
            shared_hash.each do |fridge, usrs|    
                usrs.each do |usr|
                    if usr == user
                        shared_hash[fridge].delete(usr)
                    end
                end
            end
        end

        def display_shared(shared_hash)
            display_string = ""
            shared_hash.each do |fridge, users|
                if !users.empty?
                    if shared_hash.first[0] == fridge
                        display_string = "<h2> Shared Accounts: </h2> "
                    end
                    display_string += "<h3> Fridge \'#{fridge.name}\' shared with:"
                    users.each do |user|
                        display_string+= " #{user.username}"
                        display_string+= "," if users.last != user
                    end
                    display_string += " </h3> "
                end
            end
            display_string
        end
    end

  
end