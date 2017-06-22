class ChoresController < ApplicationController
    before_action :set_chore, only: [:show, :edit, :update, :checked]
    before_action :set_category, only: [:show, :edit, :update]
    
    def index
        @chores = current_user.my_active_chores
    end
    
    def new
        @chore = Chore.new
    end
    
    def create
        user = User.find_by(id: params[:chore][:user_id])
        
        @chore = user.chores.build(chore_params)
        if @chore.save
            flash[:success] = "Successfully saved chore."
            redirect_to category_chore_path(@chore.category_id, @chore)
        else
            render :new
        end
    end

    def show
    end

    def edit
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
    end

    def checked
        @chore.update(active: false)
        flash[:success] = "You've just completed a chore!"
        redirect_to chores_path
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
