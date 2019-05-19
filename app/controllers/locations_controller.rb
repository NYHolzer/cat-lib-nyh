class LocationsController < ApplicationController 
    get 'locations' do 
        erb :"locations/index.html"
    end

    get '/locations/new'
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            erb :"locations/new.html"   
        end
    end

    post "/locations" do 
        @location = Location.new 
        @location.title = params[:title]
        @location.description = params[:description]
        @location.user_id = current_user.id 
        @location.save

        redirect "/locations"
    end 
end