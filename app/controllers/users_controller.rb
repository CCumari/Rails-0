class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "User created successfully!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User updated successfully!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "User not found"
    redirect_to root_path
  end
end
