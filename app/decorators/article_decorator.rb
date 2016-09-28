class ArticleDecorator < Draper::Decorator

  delegate_all

  def show_image(opts = :original, show_default: false)
    if object.article_image.url.present?
      object.article_image.url(opts, cloudinary: { secure: true })
    elsif show_default
      'default_article_image.jpeg'
    end
  end

  def short_content
    if object.content.length > 200
      "#{ object.content.first(200) }..."
    else
      object.content
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
