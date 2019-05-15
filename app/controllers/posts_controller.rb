class PostsController < ApplicationController
    get '/posts' do 
        "A list of publically available posts"
    end

    get '/posts/new' do 
        # checking if they are logged in
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            "A new post form"  #rendering if they are
        end
    end

    get 'posts/:id/edit' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            "A edit post form"  #rendering if they are
        end
    end
end