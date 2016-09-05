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
end