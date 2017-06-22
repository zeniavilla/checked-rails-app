class ChoresController < ApplicationController
    before_action :set_chore, only: [:show, :edit, :update, :checked, :destroy]
    before_action :set_category, only: [:show, :edit, :update]
    
    def index
        @chores = current_user.my_active_chores
    end
    
    def new
        @chore = Chore.new
    end
    
    def create        
        @chore = current_user.chores.build(chore_params)
        if @chore.save
            flash[:success] = "Successfully saved chore."
            redirect_to category_chore_path(@chore.category_id, @chore)
        else
            render :new
        end
    end

    def show
        current_user_only
    end

    def edit
        current_user_only
    end

    def update
        @chore.assign_attributes(chore_params)
        if @chore.save
            flash[:success] = "Successfully updated chore."
            redirect_to category_chore_path(@chore.category_id, @chore)
        else
            render :edit
        end
    end
    
    def destroy
        @chore.destroy
        flash[:success] = "Successfully deleted chore."
        redirect_to chores_path
    end

    def checked
        @chore.update(active: false)
        flash[:success] = "You've just completed a chore!"
        redirect_to chores_path
    end

    def current_user_only
        if @chore.user != current_user
            flash[:error] = "You can only view/edit your own chores."
            redirect_to chores_path
        end
    end
    
    private

    def set_chore
        @chore = Chore.find_by(id: params[:id])
    end

    def set_category
        @category = Category.find_by(id: params[:category_id])
    end

    def chore_params
        params.require(:chore).permit(:title, :frequency_amount, :frequency_interval, :duration_end_date, :category_attributes => [:title])
    end
end
