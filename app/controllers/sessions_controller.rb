class SessionsController < ApplicationController
  def new
    # Render the login form
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully."
      redirect_to root_path
    else
      flash.now[:error] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end
end