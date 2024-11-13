require "test_helper"

class ForbiddenFoodUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forbidden_food_user = forbidden_food_users(:one)
  end

  test "should get index" do
    get forbidden_food_users_url
    assert_response :success
  end

  test "should get new" do
    get new_forbidden_food_user_url
    assert_response :success
  end

  test "should create forbidden_food_user" do
    assert_difference("ForbiddenFoodUser.count") do
      post forbidden_food_users_url, params: { forbidden_food_user: { ingredient_id: @forbidden_food_user.ingredient_id, user_id: @forbidden_food_user.user_id } }
    end

    assert_redirected_to forbidden_food_user_url(ForbiddenFoodUser.last)
  end

  test "should show forbidden_food_user" do
    get forbidden_food_user_url(@forbidden_food_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_forbidden_food_user_url(@forbidden_food_user)
    assert_response :success
  end

  test "should update forbidden_food_user" do
    patch forbidden_food_user_url(@forbidden_food_user), params: { forbidden_food_user: { ingredient_id: @forbidden_food_user.ingredient_id, user_id: @forbidden_food_user.user_id } }
    assert_redirected_to forbidden_food_user_url(@forbidden_food_user)
  end

  test "should destroy forbidden_food_user" do
    assert_difference("ForbiddenFoodUser.count", -1) do
      delete forbidden_food_user_url(@forbidden_food_user)
    end

    assert_redirected_to forbidden_food_users_url
  end
end
