# encoding: UTF-8

require 'spec_helper.rb'

describe User do
  let(:user) { FactoryGirl.create :user }

  describe "#set_default_user_role" do
  	context "When user has role == 'admin' " do
  		it "returns role 'admin' and returns true" do
  		user.role = "admin"
  		user.set_default_user_role
  		user.role.should eq("admin")
      end
    end
  	context "When user has been create , he has role == 'user' " do
  		it "returns role 'user' and returns true" do
  		        user.set_default_user_role
  		        user.role.should eq("user")
      end
    end
  end

  describe "#admin?" do
  	context "When user is admin" do
  		it "returns true" do
  			user.role = "admin"
  			user.admin?.should be_true
  	  end
  	end
  	context "When user is not admin " do
  		it "returns false" do
  		  user.admin?.should be_false
  		end
  		it "retutns false" do
  			user.role = "user"
  			user.admin?.should be_false
  		end
  	end
  end

  let(:article) { FactoryGirl.create :article }

  describe "#read?" do
  	context "When article has been readed by user" do
  		it "returns true" do
  			article.read_by!(user)
  			user.read?(article).should be_true
  	  end
  	end
  	context "When user don`t read article" do
  		it "returns false" do
  			user.read?(article).should be_false
  		end
  	end
  end

end

# describe User do
# 	context 'Role managing' do
# 		it 'should return default role' do
# 			User.default_role.should == 'user'
# 		end

# 		it 'should set default role to new user if user not given role' do
# 			user = FactoryGirl.create :user, role: nil
# 			user.role.should == 'user'
# 		end

# 		it 'should return admin? true if user is admin' do
# 			user = FactoryGirl.create :admin
# 			user.admin?.should be_true
# 		end

# 		it 'should dont set default role if user have role before create' do
# 			user = FactoryGirl.create :user, role: 'admin'
# 			user.role.should_not == User.default_role
# 		end
# 	end
# end
