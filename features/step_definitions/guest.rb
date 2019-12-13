Given(/^I am on the stocks page$/) do
  visit('/stocks')
end

When(/^I click on show and order now$/) do
  first(:link, "Show").click
  first(:link, "Order Now").click
end

Then(/^I should be redirected to the login page$/) do
  expect(page).to have_current_path "/login"
end
