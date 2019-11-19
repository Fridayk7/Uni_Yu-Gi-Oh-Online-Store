require "application_system_test_case"

class YugiohSetsTest < ApplicationSystemTestCase
  setup do
    @yugioh_set = yugioh_sets(:one)
  end

  test "visiting the index" do
    visit yugioh_sets_url
    assert_selector "h1", text: "Yugioh Sets"
  end

  test "creating a Yugioh set" do
    visit yugioh_sets_url
    click_on "New Yugioh Set"

    fill_in "Code", with: @yugioh_set.code
    fill_in "Name", with: @yugioh_set.name
    fill_in "Year", with: @yugioh_set.year
    click_on "Create Yugioh set"

    assert_text "Yugioh set was successfully created"
    click_on "Back"
  end

  test "updating a Yugioh set" do
    visit yugioh_sets_url
    click_on "Edit", match: :first

    fill_in "Code", with: @yugioh_set.code
    fill_in "Name", with: @yugioh_set.name
    fill_in "Year", with: @yugioh_set.year
    click_on "Update Yugioh set"

    assert_text "Yugioh set was successfully updated"
    click_on "Back"
  end

  test "destroying a Yugioh set" do
    visit yugioh_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yugioh set was successfully destroyed"
  end
end
