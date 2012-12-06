require 'spec_helper.rb'
require 'devise'
include Devise::TestHelpers

describe StatisticsController do
  describe '#index' do
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it "renders the index template" do
      get :index
      response.should be_success
      response.should render_template("index")
    end

  end
end
