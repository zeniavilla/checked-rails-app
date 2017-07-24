class CategoriesController < ApplicationController
    before_action :set_category, only: :show
    
    def index
        @chores = current_owner.my_active_chores
        respond_to do |format|
            format.html { render 'index' }
            format.json { render json: @chores }
        end
    end

    def show
        @chores = current_owner.my_active_chores.where("category_id = ?", params[:id])
        respond_to do |format|
            format.html { render 'show' }
            format.json { render json: @category }
        end
    end

    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.create(category_params)
        # if @category.save
        #     flash[:success] = "Category successfully created"
            render json: @category, status: 201
        # else
        #     render :new
        # end
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

    def category_params
        params.permit(:title)
    end
end
