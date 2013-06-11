# encoding: UTF-8

require 'spec_helper.rb'
require 'devise'
include Devise::TestHelpers

describe TimeEntry do
  
  let(:user) { FactoryGirl.create :user }
  let(:admin) { FactoryGirl.create :admin}

  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:real_time) }
  it { should validate_presence_of(:status) }
 
  it { should ensure_length_of(:name).is_at_most(255) }
  #Now project is separate model
  #it { should ensure_length_of(:project).is_at_most(100) }
  it { should belong_to(:project) }
  it { should validate_numericality_of(:real_time) }
  it { should ensure_inclusion_of(:status).in_array(TimeEntry::STATUSES) }

  # Now in filter
  #it 'should respond to ::in_range' do
  #  TimeEntry.should respond_to(:in_range)
  #  random_date = "09.09.2009".to_date
  #  params={from_date: random_date, to_date: random_date, project_id: 1}
  #  TimeEntry.in_range(user, params).should be_true
  #  TimeEntry.in_range(user, params.merge(from_date: "")).should be_true
  #  TimeEntry.in_range(user, params.merge(to_date: "")).should be_true
  #  TimeEntry.in_range(user, params.merge(project_id: "")).should be_true
  #  TimeEntry.in_range(admin, params.merge(user_id: user.id)).should be_true
  #end

end
