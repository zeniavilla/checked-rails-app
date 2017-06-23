class TeamsController < ApplicationController
    def show
        @users = current_team.users
    end
end
