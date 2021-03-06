# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  date       :date
#  content    :text
#  priority   :boolean
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Memo < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :title
  validates_presence_of :content
  belongs_to :tag
  has_many :responses
  has_many :memos, through: :responses
end
