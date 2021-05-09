class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice:"You have updated user successfully."
    else
      render :edit
    end
  end
  
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def book_params
     params.require(:book).permit(:title, :body, :user_id)
  end
  
end
