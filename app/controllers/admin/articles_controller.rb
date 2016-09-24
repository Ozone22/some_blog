class Admin::ArticlesController < Admin::AdminBaseController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article), notice: 'Статья успешно создана'
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id]).decorate
  end

  def edit
    @article = Article.find_by(id: params[:id]).decorate
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.remove_image unless params[:article_image].blank?
    if @article.update_attributes(article_params)
      redirect_to admin_article_path(@article), notice: 'Успешно изменена'
    else
      render 'edit'
    end
  end

  def destroy
    Article.find_by(id: params[:id]).destroy
    redirect_to :back, notice: 'Успешно удалена'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id, :article_image)
  end
end
