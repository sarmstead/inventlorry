class SessionsController < ApplicationController
  layout "authentication"

  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: "Try again later." }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user

      if user.organizations.count == 0
        # TODO onboarding flow
      elsif user.organizations.count == 1
        set_current_organization_as(user.organizations.first)
        redirect_to after_authentication_url
      else
        redirect_to new_organization_selection_url
      end
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    cookies.delete(:organization_id)
    redirect_to new_session_path, status: :see_other
  end
end
