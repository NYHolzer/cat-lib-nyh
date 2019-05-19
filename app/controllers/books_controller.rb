class BooksController < ApplicationController
    get '/' do 
        erb :"/books/welcome.html"
    end

    get '/books' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else
            @current_user
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

    get '/books/:id/edit' do 
        if !logged_in?
            redirect '/login'  
        else 
            @book = Book.find(params[:id])
            erb :'books/edit.html'
        end
    end

    get '/books/:id' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            @book = Book.find(params[:id])
            erb :'books/show.html'
        end
    end

    post "/books/search" do 
        @books = Book.all 
        @user = current_user
        if params[:search]
            @books = Book.search(params[:search])
        else  
            @books = Book.all
        end
        erb :"books/results.html"
    end

    post "/books" do 
        @book = Book.new 
        @book.title = params[:title]
        @book.description = params[:description]
        @book.user_id = current_user.id 
        @book.save

        redirect "/books"
    end 

    patch '/books/:id' do 
        @book = Book.find(params[:id])
        @book.title = params[:title]
        @book.description = params[:description]
        @book.save 
        @book 

        redirect "/books/#{@book.id}"
    end

    delete '/books/:id' do 
        @book = Book.find(params[:id])
        @book.destroy
        
        redirect '/books'
    end



end