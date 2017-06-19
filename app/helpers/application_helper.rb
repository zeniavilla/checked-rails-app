module ApplicationHelper
    def user_signed_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]
    end
end
