require "application_system_test_case"

class AcccountsTest < ApplicationSystemTestCase
  setup do
    @acccount = acccounts(:one)
  end

  test "visiting the index" do
    visit acccounts_url
    assert_selector "h1", text: "Acccounts"
  end

  test "creating a Acccount" do
    visit acccounts_url
    click_on "New Acccount"

    fill_in "Account", with: @acccount.account_id
    fill_in "Account type", with: @acccount.account_type
    fill_in "Branch", with: @acccount.branch
    fill_in "Customer", with: @acccount.customer_id
    fill_in "Customer name", with: @acccount.customer_name
    fill_in "Date", with: @acccount.date
    fill_in "Minor indicator", with: @acccount.minor_indicator
    fill_in "Open date", with: @acccount.open_date
    fill_in "String", with: @acccount.string
    click_on "Create Acccount"

    assert_text "Acccount was successfully created"
    click_on "Back"
  end

  test "updating a Acccount" do
    visit acccounts_url
    click_on "Edit", match: :first

    fill_in "Account", with: @acccount.account_id
    fill_in "Account type", with: @acccount.account_type
    fill_in "Branch", with: @acccount.branch
    fill_in "Customer", with: @acccount.customer_id
    fill_in "Customer name", with: @acccount.customer_name
    fill_in "Date", with: @acccount.date
    fill_in "Minor indicator", with: @acccount.minor_indicator
    fill_in "Open date", with: @acccount.open_date
    fill_in "String", with: @acccount.string
    click_on "Update Acccount"

    assert_text "Acccount was successfully updated"
    click_on "Back"
  end

  test "destroying a Acccount" do
    visit acccounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acccount was successfully destroyed"
  end
end
