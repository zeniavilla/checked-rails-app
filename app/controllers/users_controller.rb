class UsersController < ApplicationController
    def index
    end

    def new
        super
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
        super
    end

    def update
        super
    end

    def destroy
        super
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :team_attributes => [:name])
    end
end
