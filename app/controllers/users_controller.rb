class UsersController < ApplicationController

  # lists all users
  def index
    @users = User.all
  end

  # displays user and favorite sweets
  def show
    @user = current_user
    @user_sweets = @user.sweets
  end

  # creates user
  def new
    @user = User.new
  end

  # saves/posts user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @User
    else
      render :new
    end
  end

  # edits profile
  def edit
    @user = User.find(params[:id])
  end

  # posts updated profile
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # deletes account
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to("/")
  end

  private

  def user_params
    params.require(:user).permit(
      :user_name,
      :avatar,
      :image,
      :password,
      :password_confirmation
    )
  end
end
