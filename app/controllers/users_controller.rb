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
        if logged_in?
            @user = User.select_by_slug(params[:slug]).first
            erb :'users/show_user'
        else
            erb :'users/failure'
        end
    end

    patch '/users/:slug' do
        if logged_in?
            @user = User.select_by_slug(params[:slug]).first
            if params[:fname].empty? || params[:lname].empty? || params[:name].empty? || params[:email].empty?
              flash[:message] = "Account information not updated.  Textboxes cannot be made blank."
              erb :'users/show_user'
            else
                change_count = 0
                if params[:fname] != @user.first_name
                    change_count += 1
                    @user.first_name = params[:fname]
                end
                if params[:lname] != @user.last_name
                    change_count += 1
                    @user.last_name = params[:lname]
                end
                if params[:name] != @user.username
                    change_count += 1
                    @user.username = params[:name]
                end
                if params[:email] != @user.email
                    change_count += 1
                    @user.email = params[:email]
                end

                if change_count > 0
                    @user.save
                    flash[:message] = "Account information has been updated!"
                else 
                    flash[:message] = "No account information to update."
                end

                erb :'users/show_user'
            end
        else
            erb :'users/failure'
        end
    end

    patch '/users/:slug/password' do
        if logged_in?
            @user = User.select_by_slug(params[:slug]).first
            if @user && @user.authenticate(params[:password_old])
                if params[:password1] == params[:password2] && !params[:password2].empty?
                    @user.password = params[:password1]
                    @user.save
                    flash[:message] = "Password has been updated!"
                    erb :'users/show_user'
                else
                    flash[:message] = "Password has not been updated. Try again."
                    erb :'users/show_user'
                end
            else
                flash[:message] = "Password has not been updated. Make sure original password is valid."
                erb :'users/show_user'
            end
        else
            erb :'users/failure'
        end
    end

    patch '/users/:slug/link' do
        if logged_in?
            @user = User.select_by_slug(params[:slug]).first
            user_to_link = User.find_by(username: params[:name])
            if user_to_link && user_to_link.authenticate(params[:password])
                link_account(user_to_link, @user)
                flash[:message] = "User \'#{user_to_link.username}\' has been linked to your account."
                erb :'users/show_user'
            else
                flash[:message] = "Unable to link account.  Verify correct username and password."
                erb :'users/failure'
            end
        else
            erb :'users/failure'
        end
    end

    patch '/users/:slug/unlink' do
        if logged_in?
            @user = User.select_by_slug(params[:slug]).first
            user_to_unlink = User.find_by(username: params[:name])
            if user_to_unlink && user_to_unlink.authenticate(params[:password])
                unlink_account(user_to_unlink, @user)
                flash[:message] = "User \'#{user_to_unlink.username}\' has been unlinked from your account."
                erb :'users/show_user'
            else
                flash[:message] = "Unable to unlink account.  Verify correct username and password."
                erb :'users/failure'
            end
        else
            erb :'users/failure'
        end

    end

    post '/users/create_user' do
        user = User.new(username: params[:name], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        if !User.all.find {|usr| usr == user} && user.save  #only true if user has typed in password.  If blank, won't be true

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

    delete '/users/:slug/delete' do
       if logged_in?
        @user = current_user
        user = User.find_by(username: params[:name])
        if user && user.authenticate(params[:password]) && user == @user
            session.clear
            @user.delete
            redirect to '/'
        else
            flash[:message] = "This is not the current account's correct account information."
            erb :'users/show_user'
        end
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
            shared_hash = eliminate_duplicates(shared_hash)
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

        def eliminate_duplicates(shared_hash)
            shared_hash.each do |fridge, usrs|   
                usrs.uniq!
            end
        end

        def display_shared(shared_hash)
            display_string = ""
            shared_hash.each do |fridge, users|
                if !users.empty?
                    if shared_hash.first[0] == fridge
                        display_string = "<ul><h2> Shared Accounts: </h2> "
                    end
                    display_string += "<li class=\"fridge\"><h5> Fridge \'#{fridge.name}\' shared with:"
                    users.each do |user|
                        display_string+= " #{user.username}"
                        display_string+= "," if users.last != user

                    end
                    display_string += " </h5> </li>"
               
                end
            end
    
            display_string += "</ul>" if !display_string.empty?
            display_string
        end

        def link_account(user_to_link, user)
            user.fridges.all.each do |fridge|
                fridge.users << user_to_link if !fridge.users.detect { |user| user == user_to_link }
            end
        end

        def unlink_account(user_to_unlink, user)
            user.fridges.all.each do |fridge|
                fridge.users.delete(user_to_unlink)
            end
        end
    end
end