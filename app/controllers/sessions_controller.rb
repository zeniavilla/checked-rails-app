class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Successfully signed in."
            redirect_to root_path
        else
            flash[:error] = "The email and password combination could not be found."
            render :new
        end
    end

    def destroy
        session.delete :user_id
        flash[:success] = "Successfully signed out."
        redirect_to root_path
    end
end
