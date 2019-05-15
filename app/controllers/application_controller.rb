class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "cat-lib-nyh"
    end

    helpers do 
        def logged_in? 
            !!session[:email]
        end

        def login(email, password) 
            #Is the user who they claim to be
            #check if a user with this email actually exists
            #if so, set the session
            user = User.find_by(:email => email) 
            if user && user.authenticate(password) #if statement assignment
                session[:email] = user.email
            else 
                redirect '/login'
            end
        end

        def logout 
            session.clear
            redirect '/posts'
            #Emailing them letting them know that they logged out
        end
    end
end