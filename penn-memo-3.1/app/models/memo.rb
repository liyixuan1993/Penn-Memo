class Memo < ApplicationRecord
  belongs_to :tag
  has_many :responses
  has_many :memos, through: :responses
end
