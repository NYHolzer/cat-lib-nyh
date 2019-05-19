class LocationsController < ApplicationController 
    get '/locations' do 
        @current_user
        @location = Location.new
        erb :"locations/index.html"
    end

    get '/locations/new' do
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            erb :"locations/new.html"   
        end
    end

    get '/locations/:id/edit' do 
        if !logged_in?
            redirect '/login'
        else 
            @current_user
            @location = Location.find(params[:id])
            erb :'locations/edit.html'
        end
    end

    post "/locations" do 
        @location = Location.new 
        @location.name = params[:name]
        @location.address = params[:address]
        @location.city = params[:city]
        @location.state = params[:state]
        @location.zip_code = params[:zip_code]
        @location.user_id = current_user.id 
        @location.save

        redirect "/locations"
    end 

    patch '/locations/:id' do 
        @location = Location.new 
        @location.name = params[:name]
        @location.address = params[:address]
        @location.city = params[:city]
        @location.state = params[:state]
        @location.zip_code = params[:zip_code]
        @location.save
        @location 

        redirect "/locations"
    end
end