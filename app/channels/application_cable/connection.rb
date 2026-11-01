module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      set_current_user || reject_unauthorized_connection
      set_current_organization
    end

    private
      def set_current_user
        if session = Session.find_by(id: cookies.signed[:session_id])
          self.current_user = session.user
        end
      end

      def set_current_organization
        organization_id = cookies.signed[:organization_id]
        self.current_organization = self.current_user.organizations.find_by(id: organization_id)
      end
  end
end
