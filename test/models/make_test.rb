require "test_helper"

class MakeTest < ActiveSupport::TestCase
  setup do
    @make_with_model = makes(:one)
  end

  test ".with_models returns only makes with associated models" do
    make_with_no_model = Make.create(name: "Make with no models")

    assert_not_empty Make.with_models.where(id: @make_with_model.id)
    assert_empty Make.with_models.where(id: make_with_no_model.id)
  end
end
