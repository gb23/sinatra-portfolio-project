class ItemsController < ApplicationController
    
    get '/items' do
        if logged_in?
            @user = current_user
            @duplicate_names = []
            @fridges_hash = {}
            @fridges_hash = create_fridges_hash(@user)
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

    helpers do
        def create_fridges_hash(user)
            duplicate_names = []
            fridges_hash = {}
   
            user.fridges.each do |fridge|
                fridges_hash[fridge] = []
                fridge.items.each do |item| 
                    if !duplicate_names.find{|slug| slug == item.slug}
                        item_grouping = user.items.select_by_slug(item.slug)
                        item[:quantity] = item_grouping.size
                        if item_grouping.size > 1
                            duplicate_names << item.slug
                        end
                        fridges_hash[fridge] << item
                    end
                end
            end 
            fridges_hash
        end
    end

end