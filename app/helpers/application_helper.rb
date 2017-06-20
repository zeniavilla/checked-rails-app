module ApplicationHelper
    def user_signed_in?
        !!session[:user_id]
    end

    def current_team
        current_user.team
    end
end
