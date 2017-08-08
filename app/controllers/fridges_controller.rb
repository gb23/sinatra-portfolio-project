class FridgesController < ApplicationController
  
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
        @fridge.name = params[:name]
        @fridge.save
        flash[:message] = "Fridge name \'#{old_name}\' changed to \'#{@fridge.name}\'."
        redirect to '/items'
      else
        erb :'users/failure'
      end
    end

    delete '/fridges/:slug/delete' do
      "Ello mate delete fridge"
    end
end
