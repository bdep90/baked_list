require 'unirest'
require 'json'
class SweetsController < ApplicationController

  # lists all sweets on user show
  # recipes show
  def index
    # @sweets = Sweet.all
    response = Unirest.get "https://community-food2fork.p.mashape.com/search",
    headers:{
      "X-Mashape-Key" => MASHKEY,
      "Accept" => "application/json"
    },
    parameters: {
      :key => FOODKEY,
      :q => params[:q],
      :sort => "r"
    }

    @res = response.body

  end

  # displays sweets on user show
  def show
    @user = current_user
    @user_sweets = @user.sweets
  end

  # creates sweets
  def new
    @sweet = Sweet.new
  end

  # saves/posts sweets to user show
  def create
    puts "I'm being super annoying"
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
      :q,
      :name,
      :description,
      :bakery_name,
      :bakery_location,
      :rating,
      :image
    )
  end

end
