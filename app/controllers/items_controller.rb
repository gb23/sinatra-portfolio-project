class ItemsController < ApplicationController
    
    get '/items' do
        if logged_in?
            @user = current_user
            @duplicate_names = []
            erb :'items/index'
        else
            erb :'users/failure'
        end
    end

    get '/items/:slug' do
        if logged_in?
            @user = current_user
binding.pry

        @item_grouping = @user.items.select_by_slug(params[:slug])

        else

        end
    end

end