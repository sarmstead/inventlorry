class OrganizationSelectionsController < ApplicationController
  layout "authentication"

  def new
    @organizations = Current.user.organizations
  end

  def create
    organization = Current.user.organizations.find(params.expect(:organization_id))
    session[:organization_id] = organization.id
    cookies.signed[:organization_id] = {
      value: organization.id,
      httponly: true,
      same_site: :lax,
      secure: Rails.env.production?
    }
    redirect_to after_authentication_url
  end
end
