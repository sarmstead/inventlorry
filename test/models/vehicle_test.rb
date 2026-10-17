require "test_helper"

class VehicleTest < ActiveSupport::TestCase
  setup do
    @model = models(:one)
    @trim = trims(:one)
    @unassociated_trim = trims(:two)
    @make = makes(:one)
  end

  test "should create a vehicle with related model and trim" do
    vehicle = Vehicle.new(make: @make, model: @model, trim: @trim)
    assert vehicle.valid?
  end

  test "should not create a vehicle with unrelated model and trim" do
    vehicle = Vehicle.new(make: @make, model: @model, trim: @unassociated_trim)
    assert_not vehicle.valid?
  end
end
