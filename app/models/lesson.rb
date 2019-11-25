class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answer
  belongs_to :activity
end
