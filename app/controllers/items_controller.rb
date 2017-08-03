class ItemsController < ApplicationController
    
    get '/items' do
        if logged_in?
            @user = current_user
            erb :'items/index'
        else
            erb :'users/failure'
        end
    end

end