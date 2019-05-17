class BooksController < ApplicationController
    get '/books' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else
            @book = Book.new
            erb :"books/index.html" 
        end
    end

    get '/books/new' do 
        # checking if they are logged in
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            erb :"books/new.html"   
        end
    end

    post "/books" do 
        @book = Book.new 
        @book.title = params[:title]
        @book.description = params[:description]
        @book.user_id = current_user.id 
        @book.save

        redirect "/books"
    end 

    get 'books/:id/edit' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            "A edit post form"  #rendering if they are
        end
    end
end