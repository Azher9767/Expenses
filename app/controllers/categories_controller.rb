class CategoriesController < ApplicationController
  def index
    @categories = Category.main
  end

  def show
    # begin
    @category = Category.find(params[:id])
    # rescue ActiveRecord::RecordNotFound => e
    #   redirect_to '/404'
    # end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add_subcategory 
    @subcategory = Category.new.subcategories.build
  end

  private

  def category_params 
    params.require(:category).permit(:name, subcategories_attributes: [:name])
  end
end
