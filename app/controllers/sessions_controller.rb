class SessionsController < ApplicationController
    def new
        @session = Session.new
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
