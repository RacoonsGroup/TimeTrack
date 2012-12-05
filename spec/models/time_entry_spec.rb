# encoding: UTF-8

require 'spec_helper.rb'

describe TimeEntry do
	it { should belong_to(:user) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:project) }
	it { should validate_presence_of(:real_time) }
	it { should validate_presence_of(:status) }

	it { should ensure_length_of(:name).is_at_most(255) }
	it { should ensure_length_of(:project).is_at_most(100) }
	it { should validate_numericality_of(:real_time) }
	it { should ensure_inclusion_of(:status).in_array(TimeEntry::STATUSES) }

  it 'should respond to ::in_date_range' do
    TimeEntry.should respond_to(:in_date_range)
    random_date = "09.09.2009".to_date
    TimeEntry.in_date_range(random_date, random_date, 1).should_not be_false
    TimeEntry.in_date_range(nil, nil, 1).should_not be_false
    TimeEntry.in_date_range(nil, random_date, nil).should_not be_false
    TimeEntry.in_date_range(nil, nil, nil).should_not be_false
  end

end
