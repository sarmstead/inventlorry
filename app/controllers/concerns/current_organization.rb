module CurrentOrganization
  extend ActiveSupport::Concern

  included do
    before_action :set_current_organization
    helper_method :set_current_organization_as
  end

  private

  def set_current_organization
    return unless Current.user

    Current.organization = Current.user.organizations.find_by(id: session[:organization_id])
  end

  def set_current_organization_as(organization)
    session[:organization_id] = organization.id
    cookies.signed[:organization_id] = {
      value: organization.id,
      httponly: true,
      same_site: :lax,
      secure: Rails.env.production?
    }
  end
end
