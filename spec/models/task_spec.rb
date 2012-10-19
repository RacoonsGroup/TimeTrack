# encoding: UTF-8

require 'spec_helper.rb'

describe Task do
	it { should belong_to(:user) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:project) }
	it { should validate_presence_of(:real_time) }
	it { should validate_presence_of(:status) }
	it { should validate_presence_of(:time_points) }

	it { should ensure_length_of(:name).is_at_most(255) }
	it { should ensure_length_of(:project).is_at_most(100) }
	it { should validate_numericality_of(:real_time) }
	it { should ensure_inclusion_of(:status).in_array(Task::STATUS_FINISHED) }
end
