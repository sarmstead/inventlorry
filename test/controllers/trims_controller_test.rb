require "test_helper"

class TrimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trim = trims(:one)
    @user = users(:one)
    sign_in_as(@user)
  end

  test "should get index" do
    get trims_url
    assert_response :success
  end

  test "should get new" do
    get new_trim_url
    assert_response :success
  end

  test "should create trim" do
    assert_difference("Trim.count") do
      post trims_url, params: { trim: { model_id: @trim.model_id, name: @trim.name } }
    end

    assert_redirected_to trim_url(Trim.last)
  end

  test "should show trim" do
    get trim_url(@trim)
    assert_response :success
  end

  test "should get edit" do
    get edit_trim_url(@trim)
    assert_response :success
  end

  test "should update trim" do
    patch trim_url(@trim), params: { trim: { model_id: @trim.model_id, name: @trim.name } }
    assert_redirected_to trim_url(@trim)
  end

  test "should destroy trim" do
    assert_difference("Trim.count", -1) do
      delete trim_url(@trim)
    end

    assert_redirected_to trims_url
  end

  def teardown
    sign_out
  end
end
