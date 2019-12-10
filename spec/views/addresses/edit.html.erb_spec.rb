require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :street => "MyString",
      :city => "MyString",
      :postcode => "MyString",
      :user => nil
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[street]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[postcode]"

      assert_select "input[name=?]", "address[user_id]"
    end
  end
end
