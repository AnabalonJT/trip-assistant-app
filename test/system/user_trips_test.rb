require "application_system_test_case"

class UserTripsTest < ApplicationSystemTestCase
  setup do
    @user_trip = user_trips(:one)
  end

  test "visiting the index" do
    visit user_trips_url
    assert_selector "h1", text: "User trips"
  end

  test "should create user trip" do
    visit user_trips_url
    click_on "New user trip"

    fill_in "Trip", with: @user_trip.trip_id
    fill_in "User", with: @user_trip.user_id
    click_on "Create User trip"

    assert_text "User trip was successfully created"
    click_on "Back"
  end

  test "should update User trip" do
    visit user_trip_url(@user_trip)
    click_on "Edit this user trip", match: :first

    fill_in "Trip", with: @user_trip.trip_id
    fill_in "User", with: @user_trip.user_id
    click_on "Update User trip"

    assert_text "User trip was successfully updated"
    click_on "Back"
  end

  test "should destroy User trip" do
    visit user_trip_url(@user_trip)
    click_on "Destroy this user trip", match: :first

    assert_text "User trip was successfully destroyed"
  end
end
