class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories
  has_many :responds
  has_many :memos, through: :responds
  has_many :user_tagships
  has_many :tags, :through => :user_tagships

end
