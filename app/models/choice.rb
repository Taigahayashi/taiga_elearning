class Choice < ApplicationRecord
  belongs_to :word
  has_many :answer,dependent: :destroy
  validates :content, presence: true
end
