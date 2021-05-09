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
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice:"successfully saved"
    else
      render "books/index"
    end
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
  
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def book_params
     params.require(:book).permit(:title, :body, :user_id)
  end
  
end
