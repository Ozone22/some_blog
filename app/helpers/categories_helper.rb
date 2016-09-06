module CategoriesHelper

  def last_categories
    @last_categories ||= Category.last(5)
  end

end
