class CategoriesController < ApplicationController
  def index
    @category = Category.all
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

  def create 
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    end
  end

  private

  def category_params 
    params.require(:category).permit(:name)
  end
end