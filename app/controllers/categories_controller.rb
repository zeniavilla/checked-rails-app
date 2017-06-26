class CategoriesController < ApplicationController
    before_action :set_category, only: :show
    
    def index
        @chores = current_owner.my_active_chores
    end

    def show
        @chores = current_owner.my_active_chores.where("category_id IS ?", params[:id])
        
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category successfully created"
            redirect_to category_path(@category.id)
        else
            render :new
        end
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

    def category_params
        params.require(:category).permit(:title)
    end
end
