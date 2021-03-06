class FridgesController < ApplicationController
  
    get '/fridges/new' do
      if logged_in?
        @user = current_user
        erb :'fridges/create_fridge'
      else
        erb :'users/failure'
      end
    end
  
  
    get '/fridges/:slug/edit' do
      if logged_in?
        @user = current_user
        @fridge = @user.fridges.select_by_slug(params[:slug]).first
        erb :'fridges/edit_fridge'
      else
        erb :'users/failure'
      end
    end

    patch '/fridges/:slug' do
      if logged_in?
        @user = current_user
        @fridge = @user.fridges.select_by_slug(params[:slug]).first
        old_name = @fridge.name
        @fridge.name = normalize_name(params[:name])
        @fridge.save
        flash[:message] = "Fridge name \'#{old_name}\' changed to \'#{@fridge.name}\'."
        redirect to '/items'
      else
        erb :'users/failure'
      end
    end

    post '/fridges' do
      if logged_in?
        @user = current_user
        fridge = Fridge.new(name: normalize_name(params[:name]))
        if @user.fridges.find {|frdge| frdge.name == fridge.name}
          flash[:message] = "You already have a fridge named \'#{fridge.name}\'.  To avoid confusion, give it a new name."
          redirect to '/fridges/new'
        else
          #reset sorting parameters
          session[:visits] = nil
          session[:sort_toggle] = nil
          session[:sort_choice] = nil
          
          @user.fridges << fridge
          redirect to '/items/new'
        end
      else
        erb :'users/failure'
      end
    end

    delete '/fridges/:slug/delete' do
       if logged_in?
        @user = current_user
        @fridge = @user.fridges.select_by_slug(params[:slug]).first
        name = @fridge.name
        @fridge.items.each do |item|
          item.delete
        end
        @fridge.delete
        
        #reset sorting parameters
        session[:visits] = nil
        session[:sort_toggle] = nil
        session[:sort_choice] = nil
        #
        flash[:message] = "\'#{name}\' and its contents have been deleted."
        redirect to "/users/#{@user.slug}"
      else
        erb :'users/failure'
      end
    end
end
