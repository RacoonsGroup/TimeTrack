# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_entry do
    name "first entry"
    real_time 1
    status "finished"
    date Date.today
  end
end
