class ItemsController < ApplicationController
    
    get '/items' do
        if logged_in?
            @user = current_user
         #   @duplicate_names = []
         #   @fridges_size = num_of_fridges(@user) 
         #   @fridge_identification = 1
       #  @items_in_fridges = items_in_fridges(@user)
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
        def num_of_fridges(user)
            user.fridges.size if user.fridges
        end

        # def items_in_fridges(user)
        #     num_of_fridges = num_of_fridges(user)
        #     fridge_identification = 0
        #     items_in_fridges = {}

        #     user.fridges.each do |fridge|

        #         items_in_fridges[fridge] = 

        #     end

         
        #     #return { #<kitchen_fridge> => [<#item>,<#item>,<#item>],   ??Quantity??
        #     #         #<beverage_fridge> => [<>,<>,<>],
        #   #           #<any_fridge> =>....
        #    #        }
        # end

        # def assign_items_to_fridge

        # end

    end

end