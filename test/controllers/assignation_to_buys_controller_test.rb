require "test_helper"

class AssignationToBuysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignation_to_buy = assignation_to_buys(:one)
  end

  test "should get index" do
    get assignation_to_buys_url
    assert_response :success
  end

  test "should get new" do
    get new_assignation_to_buy_url
    assert_response :success
  end

  test "should create assignation_to_buy" do
    assert_difference("AssignationToBuy.count") do
      post assignation_to_buys_url, params: { assignation_to_buy: { ingredient_id: @assignation_to_buy.ingredient_id, trip_id: @assignation_to_buy.trip_id, user_id: @assignation_to_buy.user_id, verified: @assignation_to_buy.verified } }
    end

    assert_redirected_to assignation_to_buy_url(AssignationToBuy.last)
  end

  test "should show assignation_to_buy" do
    get assignation_to_buy_url(@assignation_to_buy)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignation_to_buy_url(@assignation_to_buy)
    assert_response :success
  end

  test "should update assignation_to_buy" do
    patch assignation_to_buy_url(@assignation_to_buy), params: { assignation_to_buy: { ingredient_id: @assignation_to_buy.ingredient_id, trip_id: @assignation_to_buy.trip_id, user_id: @assignation_to_buy.user_id, verified: @assignation_to_buy.verified } }
    assert_redirected_to assignation_to_buy_url(@assignation_to_buy)
  end

  test "should destroy assignation_to_buy" do
    assert_difference("AssignationToBuy.count", -1) do
      delete assignation_to_buy_url(@assignation_to_buy)
    end

    assert_redirected_to assignation_to_buys_url
  end
end
