class ApplicationController < ActionController::API
  include ActionController::Cookies

    def isLoggedIn?
        if session[:user_id]
            return true
        end
        return false
    end
end 