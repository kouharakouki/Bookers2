class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
    @relationship = @user.followings.find_by(follower_id: current_user.id)
  end

  def followings
    @user = User.find(params[:user_id])
    @followings = @user.following_users
  end

  def followers
    @user = User.find(params[:user_id])
    @followers = @user.follower_users
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
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

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
