class UsersController < ApplicationController

  # lists all users
  def index
    @users = User.all
  end

  # displays user and favorite sweets
  def show
    @user = User.find(params[:id])
    @user_sweets = @user.sweet
    # binding.pry
    # TODO: implement user sweets
  end

  # creates user
  def new
    @user = User.new
  end

  # saves/posts user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:notice] = "Welcome to your new account! Add a SWEET below!"
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
      flash[:notice] = "Account information succesfully saved."
    else
      render :edit
    end
  end

  # deletes account
  def destroy
    @user = current_user
    @user.destroy
    redirect_to("/")
  end

  private

  def user_params
    params.require(:user).permit(
      :user_name,
      :image,
      :password,
      :password_confirmation
    )
  end
end
