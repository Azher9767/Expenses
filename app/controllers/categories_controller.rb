class CategoriesController < ApplicationController
  def index
    @categories = Category.main
  end

  def show
    @category = Category.find(params[:id])
    # rescue ActiveRecord::RecordNotFound => e
    #   redirect_to '/404'
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # def update 
  #   @category = Category.find(params[:id])
  
  #   category_params[:subcategories_attributes].each do |key, subcat|
  #     subcategory = Category.find_by(id: key)
  #     if subcategory
  #       subcategory.update!(subcat) 
  #     else
  #       @category.subcategories.create!(subcat)
  #     end
  #   end
  #   redirect_to @category
  #   rescue StandardError => e  
  #   render :edit, status: :unprocessable_entity
  # end

  def create 
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
   @category = Category.find(params[:id])
   parent = @category.parent
   @category.destroy

   redirect_to category_path(parent), notice: "successfully deleted!"
  end

  def add_subcategory 
    @subcategory = Category.new.subcategories.build
  end

  private

  def category_params 
    params.require(:category).permit(:name, subcategories_attributes: [:id, :name, :_destroy])
  end
end
