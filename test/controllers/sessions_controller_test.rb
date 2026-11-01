require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = User.take }

  test "new" do
    get new_session_path
    assert_response :success
  end

  test "create with valid credentials" do
    post session_path, params: { email_address: @user.email_address, password: "password" }

    assert_redirected_to root_path
    assert cookies[:session_id]
  end

  test "create with invalid credentials" do
    post session_path, params: { email_address: @user.email_address, password: "wrong" }

    assert_redirected_to new_session_path
    assert_nil cookies[:session_id]
  end

  # TODO assert onboarding flow
  # test "when user has zero organizations" do
  # end

  test "when user has more than one organization" do
    getaway_moovers = Organization.create(name: "Getaway Moovers")
    multitransit = Organization.create(name: "Multitransit Authority Partners")
    Membership.create(user: @user, organization: getaway_moovers, role: "viewer")
    Membership.create(user: @user, organization: multitransit, role: "viewer")
    post session_path, params: { email_address: @user.email_address, password: "password" }

    assert_redirected_to new_organization_selection_path
  end

  test "destroy" do
    sign_in_as(User.take)

    delete session_path

    assert_redirected_to new_session_path
    assert_empty cookies[:session_id]
    assert_empty cookies[:organization_id]
  end
end
