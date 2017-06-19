class UsersController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to edit_user_registration_path(@user)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :team_attributes => [:name])
    end
end
