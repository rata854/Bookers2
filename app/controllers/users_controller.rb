class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = current_user.id
    @user_name = current_user.name
    @user_introduction = current_user.introduction
    

  end
  
  def new
  end
  
  def create
    @user = User.new(user_params)
    @users = User.all
    if @user.save
    redirect_to book_path(@user.id), notice:"successfully saved"
    else
      render :index
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
     params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
  
end
