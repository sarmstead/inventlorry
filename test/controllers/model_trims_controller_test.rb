require "test_helper"

class ModelTrimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model = models(:one)
  end

  test "returns JSON array of trims for given model" do
    get model_trims_url(@model)
    assert_response :success

    payload = JSON.parse(response.body)
    assert payload.count === @model.trims.count
    assert payload.first["id"] === @model.trims.first.id
  end

  test "returns empty JSON array for model with no trims" do
    model = Model.create(name: "Super Duper Model", make: @model.make)

    get model_trims_url(model)
    assert_response :success

    payload = JSON.parse(response.body)
    assert payload === []
  end
end
