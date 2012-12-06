Then /^I should get a table$/ do
  page.should have_content("Task name")
  page.should have_content("Project name")
  page.should have_content("Real time")
  page.should have_content("Delivered time")
  page.should have_content("Date")
end

Then /^I should get a filter_form$/ do
  puts page.body.should =~ /from_date/
  puts page.body.should =~ /to_date/
end

Then /^I should get a datepicker$/ do
  puts page.body.should =~ /container-fluid/
end

Then /^I should get a response with status (\d+)$/ do |status|
  page.status_code.should == 200
end
