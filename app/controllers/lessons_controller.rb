class LessonsController < ApplicationController
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
	    redirect_to new_lesson_answer_path(@lesson)
    end	
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers
  end

  private

  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end
end
