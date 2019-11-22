class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
	end

	def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render 'new'
    end
	end

	def index
		@categories = Category.paginate(page: params[:page],per_page: 10)
  end

  def show
    @category = Category.find(params[:id])
  end

	def edit
		@category = Category.find(params[:id])
	end
	def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    flash[:info] = "Successflly Removed category"
    @category.destroy
    redirect_to admin_categories_url
  end
	
	private
    def category_params
      params.require(:category).permit(:title,:description)
    end
end
