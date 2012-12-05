Then /^I should get a table$/ do
  page.should have_content("Task name")
  page.should have_content("Project name")
  page.should have_content("Real time")
  page.should have_content("Delivered time")
  page.should have_content("Date")
end

Then /^I should get a filter_form$/ do
  page.should have_content("From")
  page.should have_content("To")
end

Then /^I should get a response with status (\d+)$/ do |status|
  page.status_code.should == 200
end
