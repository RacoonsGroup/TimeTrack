require 'spec_helper.rb'
require 'devise'
include Devise::TestHelpers

describe TimeEntriesController do
  describe '#create' do
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    context "when time entry successfully created" do
      it 'will send email' do
        TimeEntry.any_instance.stub(:save).and_return(true)
        TimeEntryMailer.stub(:new_time_entry).and_return('email')
        TimeEntryMailer.new_time_entry.should_receive(:deliver)
        post :create
      end
    end

    context "when time entry cannot create" do
      it 'won`t send email' do
        # TimeEntry.any_instance.stub(:save).and_return(true)
        TimeEntryMailer.stub(:new_time_entry).and_return('email')
        TimeEntryMailer.new_time_entry.should_not_receive(:deliver)
        post :create
      end
    end
  end
end
