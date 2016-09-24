class ArticleDecorator < Draper::Decorator

  delegate_all

  def show_image(opts = :original)
    unless object.article_image.url.blank?
      object.article_image.url(opts, cloudinary: { secure: true })
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
