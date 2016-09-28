module CategoriesHelper

  def last_categories
    @last_categories ||= Category.last(4)
  end

end
