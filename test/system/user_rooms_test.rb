require "application_system_test_case"

class UserRoomsTest < ApplicationSystemTestCase
  setup do
    @user_room = user_rooms(:one)
  end

  test "visiting the index" do
    visit user_rooms_url
    assert_selector "h1", text: "User Rooms"
  end

  test "creating a User room" do
    visit user_rooms_url
    click_on "New User Room"

    click_on "Create User room"

    assert_text "User room was successfully created"
    click_on "Back"
  end

  test "updating a User room" do
    visit user_rooms_url
    click_on "Edit", match: :first

    click_on "Update User room"

    assert_text "User room was successfully updated"
    click_on "Back"
  end

  test "destroying a User room" do
    visit user_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User room was successfully destroyed"
  end
end
