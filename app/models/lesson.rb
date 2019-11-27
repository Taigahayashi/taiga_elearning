class Lesson < ApplicationRecord
  belongs_to :user
	belongs_to :category
	has_many :answers, dependent: :destroy
	has_many :words, through: :answers
	has_many :choices, through: :answers

	def lesson_results
		choices.where(isCorrect: true).count
	end

	def next_word
		(category.words - words).first
	end
end
