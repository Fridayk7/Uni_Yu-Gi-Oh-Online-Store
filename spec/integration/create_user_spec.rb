require 'spec_helper'
require 'rails_helper'


RSpec.feature "Users", type: :feature do
 context 'create new user' do
   before(:each) do
     visit '/users/new'
     fill_in 'Name',:with => 'Sharon'
     fill_in 'Email',:with =>'Sharon@gmail.com'
   end
scenario "Succesfull" do

fill_in 'Password', :with =>123456789
fill_in 'Confirmation', :with =>123456789
click_button 'Create User'

expect(page).to have_content('Name: Sharon')
expect(page).to have_content('Email: Sharon@gmail.com')
end

 scenario "should fail, unmatching passwords" do
   fill_in 'Password', :with =>123456789
   fill_in 'Confirmation', :with =>987654321

   click_button 'Create User'

expect(page).to have_content("Password confirmation doesn't match Password")
 end

end
end
