# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many :memos
  has_many :user_tags
  has_many :users, through: :user_tags

  validates :name, uniqueness: true
end
