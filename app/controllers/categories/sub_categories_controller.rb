module Categories
  class SubCategoriesController < ApplicationController
    def new
      respond_to do |format|
        format.html { render partial: "categories/sub_categories/new", layout: false}
      end
    end
  end
end
