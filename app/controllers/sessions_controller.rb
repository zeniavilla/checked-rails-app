class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Successfully signed in."
            redirect_to chores_path
        else
            if !user
                flash[:error] = "An account with the email '#{params[:email]}' doesn't exist."
            elsif !user.authenticate(params[:password])
                flash[:error] = "Wrong password."
            end
            render :new
        end
    end

    def destroy
        session.delete :user_id
        flash[:success] = "Successfully signed out."
        redirect_to root_path
    end
end
