class ItemsController < ApplicationController
 
    get '/items' do
        if logged_in?
            @user = current_user
            @duplicate_names = []
            fridges_hash = {}
            fridges_hash = create_and_sort_fridges_hash(@user)
            @fridges_hash = apply_sort_to_duplicate_items(fridges_hash)
            erb :'items/index'
        else
            erb :'users/failure'
        end
    end

    post '/items' do
          if logged_in?
            @user = current_user      
          attribute_hash = {}
            # <%# #params{   
            # item => {
            #     attributes => {name:___, category:___,...,note:_____]
            #     fridge => {name:____}
            # }
     #} %>
            if !params[:item][:attributes][:name].empty?
               attribute_hash[:name] = normalize_name(params[:item][:attributes][:name])   
            end
            attribute_hash[:fridge] = @user.fridges.find_by(name: params[:item][:fridge][:name])
            attribute_hash[:category] = normalize_name(params[:item][:attributes][:category])

            if !params[:item][:attributes][:date_sell_by].empty?
                date_array = params[:item][:attributes][:date_sell_by].split("-")
                attribute_hash[:date_sell_by] = DateTime.new(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
            end
            if !params[:item][:attributes][:date_expires].empty?
                date_array = params[:item][:attributes][:date_expires].split("-")
                attribute_hash[:date_expires] = DateTime.new(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
            end
            attribute_hash[:grams] = params[:item][:attributes][:grams]
            attribute_hash[:note] = params[:item][:attributes][:note] if !params[:item][:attributes][:note].empty?
            attribute_hash[:quantity] = params[:item][:attributes][:quantity].to_i
           
            fridge = @user.fridges.find(attribute_hash[:fridge].id)
            #must be integer...
            attribute_hash[:quantity].times do
               fridge.items.create(attribute_hash)
            end

            flash[:message] = "Successfully Added Item."
            redirect to "/items/#{fridge.items.last.slug}"
        else
            erb :'users/failure'
        end 
    end

    get '/items/new' do
        if logged_in?
            @user = current_user
            erb :'items/create_item'
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

    get '/items/:slug' do
        if logged_in?
            @user = current_user
            @items = @user.items.select_by_slug(params[:slug])
            @item = @user.items.select_by_slug(params[:slug]).first
            @fridge = @item.fridge
            erb :'items/show_item'
        else
            erb :'users/failure'
        end 
    end


    get '/items/:id/edit' do
          if logged_in?
            @user = current_user
            @item = @user.items.find{|item| item.id == params[:id].to_i}
            erb :'items/edit_item'
        else
            erb :'users/failure'
        end 
    end

    delete '/items/:id/delete' do 
        if logged_in?
            user = current_user
            item = user.items.find{|item| item.id == params[:id].to_i}
            item.delete
            flash[:message] = "Successfully Deleted Item."
            redirect to '/items'
        else
            erb :'users/failure'
        end 

    end

    patch '/items/:id' do
        if logged_in?
            @user = current_user
            @item = @user.items.find{|item| item.id == params[:id].to_i}
            original_quantity = @item.quantity
            if !params[:item][:attributes][:name].empty?
               @item.name = normalize_name(params[:item][:attributes][:name])
            end
            @item.fridge = @user.fridges.find_by(name: params[:item][:fridge][:name])
            @item.category = normalize_name(params[:item][:attributes][:category])

            if !params[:item][:attributes][:date_sell_by].empty?
                date_array = params[:item][:attributes][:date_sell_by].split("-")
                @item.date_sell_by = DateTime.new(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
            end
            if !params[:item][:attributes][:date_expires].empty?
                date_array = params[:item][:attributes][:date_expires].split("-")
                @item.date_expires = DateTime.new(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
            end
            @item.quantity = params[:item][:attributes][:quantity].to_i
            @item.grams = params[:item][:attributes][:grams]
            @item.note = params[:item][:attributes][:note]
        
            fridge = @item.fridge
            if @item.quantity > original_quantity
               amount_added = (@item.quantity - original_quantity)
               amount_added.times do
               fridge.items.create(name: @item.name, fridge: @item.fridge, category: @item.category, 
               date_sell_by: @item.date_sell_by, date_expires: @item.date_expires, quantity: @item.quantity,
               grams: @item.grams, note: @item.note)
            end
            elsif @item.quantity < original_quantity
                amount_subtracted = original_quantity - @item.quantity
                amount_subtracted.times do 
                  fridge.items.last.delete
                end
            end
        #update quantity in db for ALL items, not just the new one
            @user.items.each do |item|
                if item.name == @item.name
                    item.quantity = @item.quantity
                    item.save
                end
            end
            flash[:message] = "Successfully Updated Item."
            redirect "/items/#{@item.slug}"
        else
            erb :'users/failure'
        end 
    end

    helpers do

        def create_and_sort_fridges_hash(user)
            duplicate_names = []
            fridges_hash = {}
            alphabetical_fridges = []
            alphabetical_fridges = user.fridges.order(:name)
            alphabetical_fridges.each do |fridge|
                fridges_hash[fridge] = []

                sorted_items = sort_items(fridge, user)

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
                            multiple_item_differences(user, item)
                        end
                        fridges_hash[fridge] << item
                    end
                end
            end
         fridges_hash
        end 
    end

    def multiple_item_differences(user, item)
        potential_multiples = ["category", "grams", "date_expires", "date_sell_by"]
        #in order to be in this method, item quantity is greater than 1 
        #based on slug, look for more than 1 entry in uniq array FOR each item.attribute
        #if uniq.size is greater than 1 for that attribute, set the corresponding tag.
        same_items_array = user.items.select_by_slug(item.slug)
        index = 0
        while index < potential_multiples.size
            if same_items_array.uniq{ |item| item.send(potential_multiples[index])}.size > 1
                set_tags(potential_multiples[index], item)
            end
            index += 1
        end
  

    end

    def set_tags (attribute, item)
        if attribute == "category"
        item.category = "**/@@"
        elsif attribute == "grams"
        item.grams = 0.0
        elsif attribute == "date_expires"
        item.date_expires = DateTime.new(1111,11,11)
        elsif attribute == "date_sell_by"
        item.date_sell_by = DateTime.new(1111,11,11)
        end
    end

    def sort_items(fridge, user)
        if !session[:sort_toggle].nil?
            if session[:visits] > 0 && session[:visits] < user.fridges.size
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

    def apply_sort_to_duplicate_items(fridges_hash)
        fridges_hash.each do |fridge, items|
            temp_array = []
            #looking at items array: if any items have item.session[:sort_choice] set to "**/@@"
            #remove them from items and add them to temp_array
            items.each do |item|
                if item.send(session[:sort_choice]) == "**/@@" || item.send(session[:sort_choice]) == 0.0 || item.send(session[:sort_choice]) == DateTime.new(1111,11,11)
                    temp_array << item
                    items.delete(item)
                end    
            end
            temp_array.sort_by!{|item| item[:name]}
            #sort temp array alphabetically by item.name

            items.unshift(temp_array).flatten!
            # then add temp array back to front of items.
        end
        fridges_hash
    end
end