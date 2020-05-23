class BooksController < ApplicationController
	def index
		@books = Book.all
		@book = Book.new
		@user = User.find_by(id: params[:user_id])
	end
	def create
		@books =Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		   redirect_to book_path(@book.id), notice: 'You have createded user successfully.'
	    else
	      render :index
	    end
	end
	def show
		  @book = Book.new
		  @book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
  	    if @book.update(book_params)
  	    redirect_to book_path(@book.id), notice: 'You have updated user successfully.'
  	    else
  	      render :edit
  	    end
	end
	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
    end

	private
	    def book_params
	    	params.require(:book).permit(:title, :body)
	    end
end
