class Article < ActiveRecord::Base

  belongs_to :category

  validates :title, presence: true, length: { minimum: 2, maximum: 80 }
  validates :content, presence: true
  validates :category_id, presence: true

  has_attached_file :article_image,
      content_type: { content_type: %w(image/jpeg image/png) },
      styles: { thumb: ['220x220#', :jpg],
                original: ['900x600>', :jpg] },
      convert_options: { original: '-quality 85 -strip' },
      size: { in: 0..700.kilobytes },
      path: "#{ Rails.env }/:attachment/:id/:hash.:extension",
      hash_secret: ENV['SECRET_HASH']

  validates_attachment_file_name :article_image, matches: [/png\z/, /jpe?g\z/]

  def remove_image
    unless self.article_image.blank?
      self.article_image.clear
    end
  end

end
