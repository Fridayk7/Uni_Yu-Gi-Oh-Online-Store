When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the log in message$/) do
  expect(page).to have_content("Log in")
end
