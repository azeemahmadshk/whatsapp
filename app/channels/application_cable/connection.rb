module ApplicationCable
  class Connection < ActionCable::Connection::Base

    rescue_from StandardError, with: :report_error


    identified_by :current_user

    def connect
     
      self.current_user = find_verified_user

      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
     
      if verified_user = User.find_by(id: $session)
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def report_error(e)
      SomeExternalBugtrackingService.notify(e)
    end

  end
end






