require 'erb'

class ItemsController < ApplicationController
    @sortchoice = "date_expires"

    get '/items' do
        if logged_in?
            @user = current_user
            @duplicate_names = []
            @fridges_hash = {}
            @fridges_hash = create_fridges_hash(@user, @sortchoice)
            erb :'items/index'
        else
            erb :'users/failure'
        end
    end

    get '/items/sort_date_expires' do
        @sortchoice = "date_expires"
        redirect to '/items'
    end

    get '/items/sort_date_sell_by' do
        @sortchoice = "date_sell_by"
        redirect to '/items'
    end

    get '/items/sort_name' do
        @sortchoice = "name"
        redirect to '/items'
    end

    get '/items/sort_quantity' do
        @sortchoice = "quantity"
        redirect to '/items'
    end

    get '/items/sort_category' do
        @sortchoice = "category"
        redirect to '/items'
    end

     get '/items/sort_weight' do
        @sortchoice = "weight"
        redirect to '/items'
    end


    

    get '/items/:slug' do
        if logged_in?
            @user = current_user
binding.pry
        @item_grouping = @user.items.select_by_slug(params[:slug])

        # else

        end
    end

    helpers do
        def create_fridges_hash(user, sortchoice)
            duplicate_names = []
            fridges_hash = {}
            alphabetical_fridges = []
            alphabetical_fridges = user.fridges.sort_by{|fridge| fridge.name}
            alphabetical_fridges.each do |fridge|
                fridges_hash[fridge] = []
                sorted_items = fridge.items.sort_by{|item| item.send(sortchoice) }
                sorted_items.each do |item| 
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