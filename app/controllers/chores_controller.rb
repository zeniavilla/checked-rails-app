class ChoresController < ApplicationController
    before_action :set_chore, only: [:show, :edit, :update]

    def new
        @chore = Chore.new
    end
    
    def create
    end

    def show
    end

    def edit
    end

    def update
    end
    
    def destroy
    end
    
    private

    def set_chore
        @chore = Chore.find_by(id: params[:id])
    end
end
