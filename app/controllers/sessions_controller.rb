class SessionsController < ApplicationController

  # new session
  def new
    # current_user=self.user_id in create
  end

  # instance of session
  def create
    user = User.find_by(user_name: params[:user_name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
      flash[:notice] = "Welcome Back, #{current_user.user_name}!"
    else
      redirect_to("/signin")
    end
  end

  # destroy
  def destroy
    session[:user_id] = nil
    redirect_to("/")
  end

end
