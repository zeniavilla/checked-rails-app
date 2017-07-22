class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy, :show]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Successfully signed up."
            redirect_to edit_profile_path(@user)
        else
            render :new
        end
    end

    def show
        render json: @user
    end

    def edit
    end

    def update
        @user.assign_attributes(user_params)
        if @user.save
            flash[:success] = "Successfully updated profile."
            redirect_to edit_profile_path(@user)
        else
            render :new
        end
    end

    def destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password, :team_attributes => [:name])
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
