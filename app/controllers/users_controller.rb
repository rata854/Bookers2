class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = current_user.id
        @books = Book.all
    @book = Book.new
  end
  
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
    redirect_to book_path(@book.id), notice:"successfully saved"
    else
      render :books_path
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to books_path
  end
  
  
  
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def book_params
     params.require(:book).permit(:title, :body, :user_id)
  end
  
end
