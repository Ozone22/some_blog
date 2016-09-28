class ArticlesController < ApplicationController

  def show
    @article = Article.find_by(id: params[:id]).decorate
  end

  def index
    @articles = Article.order(created_at: :desc).decorate
  end

end
