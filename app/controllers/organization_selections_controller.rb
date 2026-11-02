class OrganizationSelectionsController < ApplicationController
  layout "authentication"

  def new
    @organizations = Current.user.organizations
  end

  def create
    organization = Current.user.organizations.find(params.expect(:organization_id))
    set_current_organization_as(organization)
    redirect_to after_authentication_url
  end
end
