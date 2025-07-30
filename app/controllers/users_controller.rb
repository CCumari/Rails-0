class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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
      session[:user_id] = @user.id
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


  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "User not found"
    redirect_to root_path
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end


end
