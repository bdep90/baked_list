class SweetsController < ApplicationController

  # lists all sweets on user show
  def index
    @sweets = Sweet.all
  end

  # displays sweets on user show
  def show
    @user = current_user
    @user_sweets = @user.sweet
  end

  # creates sweets
  def new
    @sweet = Sweet.new
  end

  # saves/posts sweets to user show
  def create
    @sweet = Sweet.new(sweet_params)
    @sweet.user_id = current_user.id
    # binding.pry
    if @sweet.save
      redirect_to user_path(current_user)
      flash[:notice] = "New Sweet Created!"
    else
      render :new
    end
  end

  # deletes sweets from user show
  def destroy
    @sweet = Sweet.find(params[:id])
    @sweet.destroy
    redirect_to user_path(current_user)
  end

  private

  def sweet_params
    params.require(:sweet).permit(
      :name,
      :description,
      :bakery_name,
      :bakery_location,
      :rating,
      :image
    )
  end

end
