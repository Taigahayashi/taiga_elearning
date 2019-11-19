class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
	end
	def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render 'index'
    end
	end
	def index
		@categories = Category.paginate(page: params[:page],per_page: 10)
	end
	private
    def category_params
      params.require(:category).permit(:title,:description)
    end
end
