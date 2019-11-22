class Admin::WordsController < ApplicationController
		def index
			@category = Category.find(params[:category_id])
			@words = @category.words
			@words = Word.paginate(page: params[:page],per_page: 10)
		end

    def new
      @category = Category.find(params[:category_id])
      @word = @category.words.build
      3.times {@word.choices.build}
		end
		
    def create
			@category = Category.find(params[:category_id])
			@word = @category.words.build(words_params)
			if @word.save
				flash[:success] = "Successflly Create Word"
        redirect_to admin_category_words_url
      else
        render 'new'
      end
		end

  private
    def words_params
      params.require(:word).permit(:content, choices_attributes:[:id, :content,:isCorrect])
    end
end
