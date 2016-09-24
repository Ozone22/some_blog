class ArticlesController < ApplicationController

  def show
    @article = Article.find_by(id: params[:id]).decorate
  end

end
