require "application_system_test_case"

class AssignationToBuysTest < ApplicationSystemTestCase
  setup do
    @assignation_to_buy = assignation_to_buys(:one)
  end

  test "visiting the index" do
    visit assignation_to_buys_url
    assert_selector "h1", text: "Assignation to buys"
  end

  test "should create assignation to buy" do
    visit assignation_to_buys_url
    click_on "New assignation to buy"

    fill_in "Ingredient", with: @assignation_to_buy.ingredient_id
    fill_in "Trip", with: @assignation_to_buy.trip_id
    fill_in "User", with: @assignation_to_buy.user_id
    check "Verified" if @assignation_to_buy.verified
    click_on "Create Assignation to buy"

    assert_text "Assignation to buy was successfully created"
    click_on "Back"
  end

  test "should update Assignation to buy" do
    visit assignation_to_buy_url(@assignation_to_buy)
    click_on "Edit this assignation to buy", match: :first

    fill_in "Ingredient", with: @assignation_to_buy.ingredient_id
    fill_in "Trip", with: @assignation_to_buy.trip_id
    fill_in "User", with: @assignation_to_buy.user_id
    check "Verified" if @assignation_to_buy.verified
    click_on "Update Assignation to buy"

    assert_text "Assignation to buy was successfully updated"
    click_on "Back"
  end

  test "should destroy Assignation to buy" do
    visit assignation_to_buy_url(@assignation_to_buy)
    click_on "Destroy this assignation to buy", match: :first

    assert_text "Assignation to buy was successfully destroyed"
  end
end
