class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :responses
  has_many :memos, through: :responses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
