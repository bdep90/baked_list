class SweetsController < ApplicationController

  # lists all sweets on user show
  def index
    @sweets = Sweet.all
  end

  # displays sweets on user show
  def show
    @sweet = Sweet.find(params[:id])
  end

  # creates sweets
  def new
    @sweet = Sweet.new
  end

  # saves/posts sweets to user show
  def create
    @sweet = Sweet.new(sweet_params)
    if @sweet.save
      redirect_to @user
    else
      render :new
    end
  end

  # deletes sweets from user show
  def destroy
    @sweet = Sweet.find(params[:id])
    @sweet.destroy
    redirect_to @user
  end

  private

  def sweet_params
    params.require(:sweet).permit(
      :name,
      :description,
      :bakery_name,
      :bakery_location,
      :rating,
      :img
    )
  end

end
