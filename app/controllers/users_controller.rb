class UsersController < ApplicationController
    
    get '/signup' do 
        erb:"users/new.html"
    end

    post '/users' do
        @user = User.new 
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save 
            session[:email] = @user.email
            redirect '/books'
        else 
            erb:"users/new.html"
        end
    end
end