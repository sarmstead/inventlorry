require "test_helper"

class OrganizationSelectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.take
    sign_in_as(@user, with_organization: false)
  end

  test "create builds signed and session cookies" do
    post organization_selection_path, params: { organization_id: @user.organizations.take.id }
    assert cookies[:organization_id]
    assert session[:organization_id]
    assert_redirected_to root_url
  end

  teardown do
    sign_out
  end
end
