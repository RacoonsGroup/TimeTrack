# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    role "user"
  end

  factory :admin, parent: :user do
    email "admin@example.com"
    role "admin"
  end
end
