# encoding: UTF-8

require 'spec_helper.rb'

describe User do
	context 'Role managing' do
		it 'should return default role' do
			User.default_role.should == 'user'
		end

		it 'should set default role to new user if user not given role' do
			user = FactoryGirl.create :user, role: nil
			user.role.should == 'user'
		end

		it 'should return admin? true if user is admin' do
			user = FactoryGirl.create :admin
			user.admin?.should be_true
		end

		it 'should dont set default role if user have role before create' do
			user = FactoryGirl.create :user, role: 'admin'
			user.role.should_not == User.default_role
		end
	end
end
