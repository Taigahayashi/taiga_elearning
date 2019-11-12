class User < ApplicationRecord
  #filter method to transform email to small case before saving to db 
  before_save {email.downcase!}

  validates :name, presence: true, length: {maximum:50 }
  # REGEX = Reguuler Expression
  # To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:50 },
                                    format: {with: EMAIL_REGEX},
                                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password,length:{minimum:6}, allow_nil:true
end
