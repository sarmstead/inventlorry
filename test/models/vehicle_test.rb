require "test_helper"

class VehicleTest < ActiveSupport::TestCase
  setup do
    @model = models(:one)
    @trim = trims(:one)
    @unassociated_trim = trims(:two)
    @make = makes(:one)
    @organization = organizations(:one)
    @unassociated_organization = organizations(:two)
  end

  test "should create a vehicle with related model and trim" do
    vehicle = Vehicle.new(name: "Biggly Wiggly", make: @make, model: @model, trim: @trim, organization: @organization)
    assert vehicle.valid?
  end

  test "should not create a vehicle with unrelated model and trim" do
    vehicle = Vehicle.new(name: "Biggly Wiggly", make: @make, model: @model, trim: @unassociated_trim, organization: @organization)
    assert_not vehicle.valid?
  end

  test "is not valid when make / model / trim organization does not match vehicle's organization" do
    vehicle = Vehicle.new(name: "Biggly Wiggly", make: @make, model: @model, trim: @trim, organization: @unassociated_organization)
    assert_not vehicle.valid?
    assert_includes vehicle.errors[:base], "Make must belong to vehicle's organization"
    assert_includes vehicle.errors[:base], "Model must belong to vehicle's organization"
    assert_includes vehicle.errors[:base], "Trim must belong to vehicle's organization"
  end
end
