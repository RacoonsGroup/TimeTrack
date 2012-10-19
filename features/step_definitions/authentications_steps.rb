Given /^I exist as a user$/ do
  @current_user = Factory.create :user
end

Given /^I am not signed in$/ do
  @current_user = nil
end

Given /^I am signed in as user with email "(.+)"$/ do |user_email|
  @current_user = User.where(email: user_email).first
  sign_in_with @current_user.email, "123456"
end

Given /^I am signed in as user$/ do
  @current_user = Factory.create :user
  sign_in_with @current_user.email, "123456"
end

Given /^I am signed in as admin$/ do
  @current_user = Factory.create :admin
  sign_in_with @current_user.email, "123456"
end

Given /^I am signed in as super_admin$/ do
  @current_user = Factory.create :super_admin
  sign_in_with @current_user.email, "123456"
end

# For future can be removed

Then /^I should be signed in$/ do
  within "nav" do
    page.should have_content "Sign out"
  end
end

Then /^I should be signed out$/ do
  within "nav" do
    page.should_not have_content "Sign out"
  end
end

def sign_in_with(email, password)
  visit new_user_session_path

  fill_in "Email", with: email
  fill_in "Password", with: password
  
  click_button "Sign in"
end