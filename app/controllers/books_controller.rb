class BooksController < ApplicationController
    get '/' do 
        erb :"/books/welcome.html"
    end

    get '/books' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else
            @books = @current_user.books
            erb :"books/index.html" 
        end
    end

    get '/books/new' do 
        # checking if they are logged in
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else 
            @current_user
            @location = Location.new
            erb :"books/new.html"   
        end
    end

    get '/books/:id/edit' do 
        if !logged_in?
            redirect '/login'  
        else 
            @book = @current_user.books.find(params[:id])
            @locations = @current_user.locations
            erb :'books/edit.html'
        end
    end

    get '/books/:id' do 
        if !logged_in?
            redirect '/login'  #Redirecting if they aren't
        else
            @book = @current_user.books.find(params[:id])
            erb :'books/show.html'
        end
    end

    post "/books/search" do 
        @books = Book.all 
        @user = current_user
        if params[:search]
            @books = @current_user.books.search(params[:search])
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
        @book.location = Location.find_by(name: params[:location])
        @book.save
        @book 
        
        redirect "/books"
    end 

    patch '/books/:id' do 
        @book = Book.find(params[:id])
        @book.title = params[:title]
        @book.description = params[:description]
        @book.location = Location.find_by(name: params[:location])
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