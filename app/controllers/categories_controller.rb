
class CategoriesController < ApplicationController
 

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:success] = "Category created successfully!"
      puts "Category created successfully!"
      puts "Category details:"
      puts @category.inspect
      redirect_to category_path(@category)
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  
end