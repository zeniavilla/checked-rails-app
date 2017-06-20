class ChoresController < ApplicationController
    before_action :set_chore, only: [:show, :edit, :update]

    def new
        @chore = Chore.new
    end
    
    def create
        @chore = Chore.new(chore_params)
        if @chore.save
            flash[:success] = "Successfully saved chore."
            redirect_to category_chore_path(@chore.category_id, @chore)
        else
            render :new
        end
    end

    def show
        @category = Category.find_by(id: params[:category_id])
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
        params.require(:chore).permit(:title, :frequency_amount, :frequency_interval, :duration_end_date, :category_attributes => [:title])
    end
end
