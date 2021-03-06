class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	  @book = Book.new
  	  @user = User.find(params[:id])
  	  @books = @user.books.reverse_order
  end
  def edit
       @user = User.find(params[:id])
       if @user == current_user
    else
      @books = @user.books.reverse_order
        @book = Book.new
        redirect_to user_path(current_user.id)
    end
  end
  def update
  	  @user = User.find(params[:id])
  	  if @user.update(user_params)
  	     redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
      else
        render :edit
      end
  end
  def index
      @users = User.all
      @book = Book.new
      @confict = @users.reverse_order
  end

  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :profile_image)
  end
end


