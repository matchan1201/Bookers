class UsersController < ApplicationController
  def show
  	  @book = Book.new
  	  @user = User.find_by(id: params[:id])
  	  @books = @user.books.reverse_order
  end
end
