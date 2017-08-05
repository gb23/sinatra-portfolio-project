class ItemsController < ApplicationController
 
    get '/items' do

        if logged_in?
            @user = current_user
            @duplicate_names = []
            @fridges_hash = {}
            @fridges_hash = create_and_sort_fridges_hash(@user)
            erb :'items/index'
        else
            erb :'users/failure'
        end
    end
    
    get '/items/sort_date_expires' do
        session[:sort_choice] = "date_expires"
        redirect to '/items'
    end

    get '/items/sort_date_sell_by' do
        session[:sort_choice] = "date_sell_by"
        redirect to '/items'
    end

    get '/items/sort_name' do
        session[:sort_choice] = "name"
        redirect to '/items'
    end

    get '/items/sort_quantity' do
        session[:sort_choice] = "quantity"
        redirect to '/items'
    end

    get '/items/sort_category' do
        session[:sort_choice] = "category"
        redirect to '/items'
    end

     get '/items/sort_grams' do
        session[:sort_choice] = "grams"
        redirect to '/items'
    end

    helpers do
        def create_and_sort_fridges_hash(user)
            duplicate_names = []
            fridges_hash = {}
            alphabetical_fridges = []
            alphabetical_fridges = user.fridges.order(:name)
            alphabetical_fridges.each do |fridge|
                fridges_hash[fridge] = []
                sorted_items = sort_items(fridge)
                sorted_items.each do |item| 
                    if !duplicate_names.find{|slug| slug == item.slug}

                        item_grouping = user.items.select_by_slug(item.slug)
                        item_grouping.each do |i|
                            i.quantity = item_grouping.size
                            i.save
                        end
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

    def sort_items(fridge)
        if !session[:sort_toggle].nil?
            if session[:visits] > 0 && session[:visits] < 3
                session[:visits] = session[:visits] + 1
            else
                session[:sort_toggle] == 0 ? session[:sort_toggle] = 1 : session[:sort_toggle] = 0
                session[:visits] = 1
            end
        end
        if session[:sort_choice] != "date_expires" && session[:sort_choice] != "date_sell_by" && !session[:sort_choice].nil?
            if session[:sort_toggle] == 1
                fridge.items.order(session[:sort_choice] + " " + "DESC") 
            else
                fridge.items.order(session[:sort_choice])
            end
        elsif session[:sort_choice] == "date_sell_by"
            if session[:sort_toggle] == 1
                fridge.items.order('CASE WHEN date_sell_by IS NULL THEN 1 ELSE 0 END, date_sell_by DESC')
            else
                fridge.items.order('CASE WHEN date_sell_by IS NULL THEN 1 ELSE 0 END, date_sell_by')
            end
        else
            #default
            if session[:sort_toggle].nil?
                session[:visits] = 1
                session[:sort_toggle] = 0
                session[:sort_choice] = "date_expires"
                fridge.items.order('CASE WHEN date_expires IS NULL THEN 1 ELSE 0 END, date_expires')
            else
                if session[:sort_toggle] == 1
                    fridge.items.order('CASE WHEN date_expires IS NULL THEN 1 ELSE 0 END, date_expires DESC')
                else
                    fridge.items.order('CASE WHEN date_expires IS NULL THEN 1 ELSE 0 END, date_expires')
                end
            end
        end
    end
end