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
        @fridge.name = params[:name]
        @fridge.save

        redirect to '/items'
      else
        erb :'users/failure'
      end
    end

    delete '/fridges/:slug/delete' do
      "Ello mate delete fridge"
    end
end
