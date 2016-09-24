module Admin::CategoriesHelper

  def categories_data_select_tag
    Category.all.map { |c| [c.title, c.id] }
  end

end
