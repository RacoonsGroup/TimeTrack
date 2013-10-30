
FactoryGirl.define do
  factory :project do
    project_name "project"
    project_description "project description"
    payment_type 'internal'
    disable false
  end

  factory :disable_project do
    project_name "project"
    project_description "project description"
    disable true
  end
end
