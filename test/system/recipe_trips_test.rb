require "application_system_test_case"

class RecipeTripsTest < ApplicationSystemTestCase
  setup do
    @recipe_trip = recipe_trips(:one)
  end

  test "visiting the index" do
    visit recipe_trips_url
    assert_selector "h1", text: "Recipe trips"
  end

  test "should create recipe trip" do
    visit recipe_trips_url
    click_on "New recipe trip"

    fill_in "Recipe", with: @recipe_trip.recipe_id
    fill_in "Trip", with: @recipe_trip.trip_id
    click_on "Create Recipe trip"

    assert_text "Recipe trip was successfully created"
    click_on "Back"
  end

  test "should update Recipe trip" do
    visit recipe_trip_url(@recipe_trip)
    click_on "Edit this recipe trip", match: :first

    fill_in "Recipe", with: @recipe_trip.recipe_id
    fill_in "Trip", with: @recipe_trip.trip_id
    click_on "Update Recipe trip"

    assert_text "Recipe trip was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe trip" do
    visit recipe_trip_url(@recipe_trip)
    click_on "Destroy this recipe trip", match: :first

    assert_text "Recipe trip was successfully destroyed"
  end
end
