require "application_system_test_case"

class ForbiddenFoodUsersTest < ApplicationSystemTestCase
  setup do
    @forbidden_food_user = forbidden_food_users(:one)
  end

  test "visiting the index" do
    visit forbidden_food_users_url
    assert_selector "h1", text: "Forbidden food users"
  end

  test "should create forbidden food user" do
    visit forbidden_food_users_url
    click_on "New forbidden food user"

    fill_in "Ingredient", with: @forbidden_food_user.ingredient_id
    fill_in "User", with: @forbidden_food_user.user_id
    click_on "Create Forbidden food user"

    assert_text "Forbidden food user was successfully created"
    click_on "Back"
  end

  test "should update Forbidden food user" do
    visit forbidden_food_user_url(@forbidden_food_user)
    click_on "Edit this forbidden food user", match: :first

    fill_in "Ingredient", with: @forbidden_food_user.ingredient_id
    fill_in "User", with: @forbidden_food_user.user_id
    click_on "Update Forbidden food user"

    assert_text "Forbidden food user was successfully updated"
    click_on "Back"
  end

  test "should destroy Forbidden food user" do
    visit forbidden_food_user_url(@forbidden_food_user)
    click_on "Destroy this forbidden food user", match: :first

    assert_text "Forbidden food user was successfully destroyed"
  end
end
