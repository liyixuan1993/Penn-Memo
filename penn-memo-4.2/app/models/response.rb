# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  content    :string
#  user_id    :integer
#  memo_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  belongs_to :user
  belongs_to :memo
end
