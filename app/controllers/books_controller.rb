class BooksController < ApplicationController
	before_action :authenticate_user!
	def index
		@books = Book.all
		@book = Book.new
		@user = User.find_by(id: params[:user_id])
	end
	def create
		@books =Book.all
		@book = Book.new(book_params)
		binding.pry
		@book.user_id = current_user.id
		if @book.save!
		   redirect_to book_path(@book.id), notice: 'You have createded user successfully.'
	    else
	      render :index
	    end
	end
	def show
		  @newbook = Book.new
		  @book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
		if @book.user == current_user
			render :edit
		else
			redirect_to books_path
		end
	end
	def update
		@book = Book.find(params[:id])
  	    if @book.update(book_params)
  	    redirect_to book_path(@book.id), notice: 'successfully update book!'
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
