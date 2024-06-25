class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
 before_action :correct_user, only: [:edit, :update]
  
  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def show
    @user=User.find(params[:id])
    @book = Book.new
    @books=@user.books
  end

  def edit
  end
  

  def update
    @user=set_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end
  
  private
  
  def correct_user
    unless @user == current_user
      redirect_to user_path(current_user)
      end
end
  
   def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
