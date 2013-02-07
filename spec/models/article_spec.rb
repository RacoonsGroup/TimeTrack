require 'spec_helper'

describe Article do

  let(:user)    { FactoryGirl.create :user }
  let(:article) { FactoryGirl.create :article }

  it { should validate_presence_of :importance }
  it { should validate_presence_of :short_description }
  it { should validate_presence_of :title }
  it { should validate_presence_of :url } 

  describe "#read_by?" do
  	context "When article is readed by user" do
  		it "returns true" do        
        article.read_by!(user)
        article.read_by?(user).should be_true
      end  
    end
    context "When article is not readed by user" do
      it "returns false" do       
        article.read_by?(user).should be_false        
      end  
    end
  end

  describe "#unread_by!" do
    context "When status of article was read and has been changed on 'unread'" do
      it "return false" do
        article.read_by!(user)
        article.unread_by!(user)
        article.read_by?(user).should be_false
      end
    end
    context "When status of article was read and has not been changed" do
      it "return true" do
        article.read_by!(user)
        article.read_by?(user).should be_true
      end
    end
  end

  describe "#read_by!" do
    context "When article`s status has been changed on 'read'" do
      it "return true" do
        article.read_by!(user)      
        article.read_by?(user).should be_true
      end  
    end
    context "When status of article has not been changed" do
      it "return false" do
        article.read_by?(user).should be_false
      end  
    end  
  end

  describe "#toggle_read" do
    context "When article status is 'read'" do
      it "changed status on 'unread'" do
        article.read_by!(user)
        article.toggle_read(user)
        article.read_by?(user).should be_false  
      end  
    end
    context "When article status is 'unread'" do
      it "changed status on 'read'" do
        article.toggle_read(user)
        article.read_by?(user).should be_true  
      end
    end  
  end  

end
