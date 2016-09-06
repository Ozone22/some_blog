class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(id: params[:id])
  end

  def index
    @categories = Category.all
  end

end
