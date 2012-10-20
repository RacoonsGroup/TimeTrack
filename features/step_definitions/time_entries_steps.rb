Then /^I should see all needed fields for creating time entry$/ do
  page.should have_content('Name')
  page.should have_content('Project')
  page.should have_content('Status')
  page.should have_content('Real time')
  page.should have_content('Time points')
  page.should have_content('Description')
end

When /^I fill in invalid time entry data$/ do
  fill_in "time_entry_name", with: ""
  fill_in "time_entry_project", with: ""
  click_on("Save time entry")
end

Then /^I should see time entry error$/ do
  page.should have_content("can't be blank")
end

When /^I fill in valid time entry data$/ do
  fill_in "time_entry_name", with: "first time entry"
  fill_in "time_entry_project", with: "TimeTrack"
  fill_in "time_entry_status", with: "processing"
  fill_in "time_entry_real_time", with: 3
  fill_in "time_entry_time_points", with: 1.5
  click_on("Save time entry")
end

Then /^I should see my time entry$/ do
  page.should have_content('first time entry')
end
