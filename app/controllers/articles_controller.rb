class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
    
  end

  def index
  
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    
    @article.save
    if @article.errors.any?
      flash[:error] = @article.errors.full_messages.join(", ")
      render :new
      return
    end
    flash[:success] = "Article created successfully!"
    puts "Article created successfully!"
    puts "Article details:"
    puts @article.inspect
    redirect_to article_path(@article)
    
  end

  def edit
    
  end
  def update
    
    @article.update(article_params)
    
    if @article.errors.any?
      flash[:error] = @article.errors.full_messages.join(", ")
      render :edit
      return
    end
    flash[:success] = "Article updated successfully!"
    puts "Article updated successfully!"
    puts "Updated article details:"
    puts @article.inspect
    redirect_to article_path(@article)
  end

  def destroy
    
    @article.destroy
    flash[:success] = "Article deleted successfully!"
    puts "Article deleted successfully!"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find_by(id: params[:id])
    unless @article
      flash[:error] = "Article not found"
      redirect_to articles_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :content, :author, :genre)
  end
end
