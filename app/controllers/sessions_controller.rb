class SessionsController < ApplicationController
    def new   
    end

    def create
        if auth['uid']
            @user = User.find_or_create_by_omniauth(auth)
            success_sign_up
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                success_sign_up
            else
                if !@user
                    flash[:error] = "An account with the email '#{params[:email]}' doesn't exist."
                elsif !@user.authenticate(params[:password])
                    flash[:error] = "Wrong password."
                end
                render :new
            end
        end

    end

    def destroy
        session.delete :user_id
        flash[:success] = "Successfully signed out."
        redirect_to root_path
    end

    def auth
        request.env['omniauth.auth']
    end

    def success_sign_up
        session[:user_id] = @user.id
        flash[:success] = "Successfully signed in."
        redirect_to chores_path
    end
end
