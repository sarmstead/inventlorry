module CurrentOrganization
  extend ActiveSupport::Concern

  included do
    before_action :set_current_organization
  end

  private

  def set_current_organization
    return unless Current.user

    Current.organization = Current.user.organizations.find_by(id: session[:organization_id])
  end
end
