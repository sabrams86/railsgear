class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
    respond_to do |format|
      if request.xhr?
        format.json { render :json => @categories }
      else
        format.html # show.html.erb
        format.xml  { render :xml => @categories }
      end
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
