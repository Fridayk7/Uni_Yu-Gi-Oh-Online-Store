Given(/^I am on the login page$/) do
  visit('/login')
end

When(/^I fill in the login form with false credentials$/) do
  fill_in('Email', :with => 'test@test.com')
  fill_in('Password', :with => '123456789')
  click_button "Log in"
end

Then(/^I should see an error message$/) do
  page.has_content?("Invalid email/password combination")
end
