require "test_helper"

class ModelTest < ActiveSupport::TestCase
  setup do
    @model_with_trims = makes(:one)
  end

  test ".with_trims returns only models with associated trims" do
    model_with_no_trims = Model.create(name: "Model with no trims")

    assert_not_empty Model.with_trims.where(id: @model_with_trims.id)
    assert_empty Model.with_trims.where(id: model_with_no_trims.id)
  end
end
