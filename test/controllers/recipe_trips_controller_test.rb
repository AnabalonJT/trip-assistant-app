require "test_helper"

class RecipeTripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_trip = recipe_trips(:one)
  end

  test "should get index" do
    get recipe_trips_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_trip_url
    assert_response :success
  end

  test "should create recipe_trip" do
    assert_difference("RecipeTrip.count") do
      post recipe_trips_url, params: { recipe_trip: { recipe_id: @recipe_trip.recipe_id, trip_id: @recipe_trip.trip_id } }
    end

    assert_redirected_to recipe_trip_url(RecipeTrip.last)
  end

  test "should show recipe_trip" do
    get recipe_trip_url(@recipe_trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_trip_url(@recipe_trip)
    assert_response :success
  end

  test "should update recipe_trip" do
    patch recipe_trip_url(@recipe_trip), params: { recipe_trip: { recipe_id: @recipe_trip.recipe_id, trip_id: @recipe_trip.trip_id } }
    assert_redirected_to recipe_trip_url(@recipe_trip)
  end

  test "should destroy recipe_trip" do
    assert_difference("RecipeTrip.count", -1) do
      delete recipe_trip_url(@recipe_trip)
    end

    assert_redirected_to recipe_trips_url
  end
end
