class Admin::CategoriesController < Admin::AdminBaseController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Успешно создана'
    else
      render 'new'
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, notice: 'Успешно изменена'
    else
      render 'edit'
    end
  end

  def destroy
    Category.find_by(id: params[:id]).destroy
    redirect_to admin_categories_path, notice: 'Успешно удалено'
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
