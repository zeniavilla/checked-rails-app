class ChoresController < ApplicationController
    before_action :set_chore, only: [:show, :edit, :update]

    def new
        @chore = Chore.new
    end
    
    def create
        raise params.inspect
        @chore = Chore.new(chore_params)
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

    def chore_params
        params.require(:chore).permit(:title, :frequency_amount, :frequency_interval, :duration_end_date)
    end
end
