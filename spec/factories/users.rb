# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password '123456'
    password_confirmation '123456'
    #role "user"
  end

  factory :admin, parent: :user do
    email "admin@example.com"
    role "admin"
  end

  factory :user_racoon, parent: :user do
    email "racoon@example.com"
  end

  factory :user_fox, parent: :user do
    email "fox@example.com"
  end

end
