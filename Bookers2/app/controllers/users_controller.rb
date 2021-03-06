class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
  end
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
