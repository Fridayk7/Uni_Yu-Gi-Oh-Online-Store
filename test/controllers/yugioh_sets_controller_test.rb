require 'test_helper'

class YugiohSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yugioh_set = yugioh_sets(:one)
  end

  test "should get index" do
    get yugioh_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_yugioh_set_url
    assert_response :success
  end

  test "should create yugioh_set" do
    assert_difference('YugiohSet.count') do
      post yugioh_sets_url, params: { yugioh_set: { code: @yugioh_set.code, name: @yugioh_set.name, year: @yugioh_set.year } }
    end

    assert_redirected_to yugioh_set_url(YugiohSet.last)
  end

  test "should show yugioh_set" do
    get yugioh_set_url(@yugioh_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_yugioh_set_url(@yugioh_set)
    assert_response :success
  end

  test "should update yugioh_set" do
    patch yugioh_set_url(@yugioh_set), params: { yugioh_set: { code: @yugioh_set.code, name: @yugioh_set.name, year: @yugioh_set.year } }
    assert_redirected_to yugioh_set_url(@yugioh_set)
  end

  test "should destroy yugioh_set" do
    assert_difference('YugiohSet.count', -1) do
      delete yugioh_set_url(@yugioh_set)
    end

    assert_redirected_to yugioh_sets_url
  end
end
