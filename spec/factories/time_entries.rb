# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_entry do
    name "first entry"
    project "test"
    real_time 1
    status "finished"
  end
end
