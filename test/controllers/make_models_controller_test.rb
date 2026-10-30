require "test_helper"

class MakeModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @make = makes(:one)
    @user = users(:one)
    sign_in_as(@user)
  end

  test "returns JSON array of models for given make" do
    get make_models_url(@make)
    assert_response :success

    payload = JSON.parse(response.body)
    assert payload.count === @make.models.count
    assert payload.first["id"] === @make.models.first.id
  end

  test "returns empty JSON array for make with no models" do
    toyota = Make.create(name: "Toyota")

    get make_models_url(toyota)
    assert_response :success

    payload = JSON.parse(response.body)
    assert payload === []
  end

  def teardown
    sign_out
  end
end
