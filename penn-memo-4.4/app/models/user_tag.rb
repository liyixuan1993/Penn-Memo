# == Schema Information
#
# Table name: user_tags
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates_uniqueness_of :tag_id, :scope => :user_id
end
