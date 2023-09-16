require "application_system_test_case"

class TwitersTest < ApplicationSystemTestCase
  setup do
    @twiter = twiters(:one)
  end

  test "visiting the index" do
    visit twiters_url
    assert_selector "h1", text: "Twiters"
  end

  test "should create twiter" do
    visit twiters_url
    click_on "New twiter"

    fill_in "Description", with: @twiter.description
    fill_in "User name", with: @twiter.user_name
    click_on "Create Twiter"

    assert_text "Twiter was successfully created"
    click_on "Back"
  end

  test "should update Twiter" do
    visit twiter_url(@twiter)
    click_on "Edit this twiter", match: :first

    fill_in "Description", with: @twiter.description
    fill_in "User name", with: @twiter.user_name
    click_on "Update Twiter"

    assert_text "Twiter was successfully updated"
    click_on "Back"
  end

  test "should destroy Twiter" do
    visit twiter_url(@twiter)
    click_on "Destroy this twiter", match: :first

    assert_text "Twiter was successfully destroyed"
  end
end
