module SessionTestHelper
  def sign_in_as(user, **options)
    post session_path, params: {
      email_address: user.email_address,
      password: "password"
    }

    organization = options[:with_organization]
    return if organization == false

    organization ||= user.organizations.first
    raise "User must belong to an organization" unless organization

    post organization_selection_path, params: {
      organization_id: organization.id
    }
  end

  def sign_out
    delete session_path
  end
end

ActiveSupport.on_load(:action_dispatch_integration_test) do
  include SessionTestHelper
end
