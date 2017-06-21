class TeamsController < ApplicationController
    def show
        @team = current_team
    end
end
