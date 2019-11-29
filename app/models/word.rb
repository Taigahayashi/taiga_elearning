class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  has_many :answer,dependent: :destroy
  validate :has_one_correct_answer
  accepts_nested_attributes_for :choices
  validates :choices, presence: true
  validates :content, presence: true
  validate :has_unique_choice

  def has_one_correct_answer
    if choices.select{|choice| choice.isCorrect? }.count !=1
      return errors.add :base,"Must have one correct choice"
    end
  end

  def has_unique_choice
    @uniq_choices = choices.uniq{|choice| choice.content}.length
    if @uniq_choices < choices.length
      return errors.add :base,"Must have uniqe choice"
    end
  end

  def correct_answer
    choices.find_by(isCorrect:true).try(:content)
  end
end
