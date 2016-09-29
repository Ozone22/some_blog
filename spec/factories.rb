FactoryGirl.define do

  factory :user do
    sequence(:login) { |n| "UserFactory#{n}" }
    sequence(:email) { |n| "UserEmail#{n}@tmp.com" }
    password 'password1D'
    password_confirmation 'password1D'

    factory :admin do
      admin true
    end
  end

  factory :category do
    sequence(:title) { |n| "CategoryTitle#{n}" }
  end

  factory :article do
    sequence(:title) { |n| "ArticleTitle#{n}" }
    content 'Simple content'
    article_image { File.new("#{Rails.root}/spec/fixtures/images/default_article_image.jpeg") }
    category
  end
end