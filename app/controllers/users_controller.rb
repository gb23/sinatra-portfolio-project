class UsersController < ApplicationController
    get '/organizations/login' do
        erb :'organizations/login'
    end

    get '/organizations/create_organization' do
        erb :'organizations/create_organization'
    end

    post '/organizations/create_organization' do

        org = Organization.new(name: params[:name], password: params[:password], about: params[:content])
        if org.save #only true if user has typed in password.  If blank, won't be true
            redirect to '/rockets'
        else
            erb :'organization/failure'
        end
    end

    post '/organizations/login' do
        organization = Organization.find_by(name: params[:name])
        if organization && organization.authenticate(params[:password])
            session[:user_id] = organization.id
            redirect to '/rockets'
        else
            redirect to '/organizations/failure'
        end
    end

    get '/organizations/failure' do 
        erb :'organizations/failure'
    end
end