require 'spec_helper.rb'
require 'devise'
include Devise::TestHelpers

describe TimeEntriesController do
  describe '#create' do
    context "when te successfully created" do
      it 'will send email' do
        # sign_in FactoryGirl.create(:user)
        # params = { time_entry: FactoryGirl.build(:time_entry).attributes.reject {|k,v| v.nil?} }
        TimeEntryMailer.should_receive(:new_time_entry)
        TimeEntry.any_instance.stub(:valid?).and_return(true)
        TimeEntriesController.stub!(:current_user).and_return(FactoryGirl.build(:user))
        post :create
        TimeEntry.any_instance.unstub(:valid?)
      end
    end
  end
end