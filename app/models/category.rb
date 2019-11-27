class Category < ApplicationRecord
  validates :title, presence: true,length: {maximum:20}
  validates :description, presence: true,length: {maximum:30}
  has_many :words, dependent: :destroy
  has_many :lessons,dependent: :destroy
end
