class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def require_logged_in
        unless logged_in?
            redirect_to new_session_url
        end
    end

    def require_logged_out
        if logged_in?
            redirect_to user_url(current_user)
        end
    end

    def log_in(user)
        user.reset_session_token!
        session[:session_token] = user.session_token
    end

    def log_out(user)
        user.reset_session_token!
        session[:session_token] = nil
    end

end
