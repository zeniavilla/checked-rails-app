class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category successfully created"
            redirect_to categories_path
        else
            # flash[:error] = "Title can't be blank."
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

    def category_params
        params.require(:category).permit(:title)
    end
end
