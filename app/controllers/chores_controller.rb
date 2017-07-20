class ChoresController < ApplicationController
    before_action :set_chore, only: [:show, :edit, :update, :checked, :destroy]
    before_action :set_category, only: [:show, :new, :create, :edit, :update]
    
    def index
        @chores = current_user.my_active_chores
        @chore = Chore.new
        @category = Category.find_or_create_by(title: "Uncategorized")
    end
    
    def new
        @chore = Chore.new
    end
    
    def create
        user = User.find_by(id: params[:chore][:user_id]) || current_user
        @chore = user.chores.build(chore_params)
        if @chore.save
            flash[:success] = "Successfully saved chore."
            respond_to do |format|
                format.html { redirect_to category_chore_path(@chore.category_id, @chore) }
                format.json { render json: @chore }
            end
            
        else
            render :new
        end
    end

    def show
        current_owner_only
        respond_to do |format|
            format.html { render 'show' }
            format.json { render json: @chore }
        end
    end

    def edit
        current_owner_only
    end

    def update
        @chore.assign_attributes(chore_params)
        @chore.user = User.find(params[:chore][:user_id])
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

    def current_owner_only
        if !current_owner.chores.find_by(id: @chore.id)
            flash[:error] = "You can only view your own chores."
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
