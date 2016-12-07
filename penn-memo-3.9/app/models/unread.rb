# == Schema Information
#
# Table name: unreads
#
#  id           :integer         not null, primary key
#  memo_id      :integer
#  user_id      :integer
#  notification :boolean
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Unread < ApplicationRecord
  belongs_to :memo
  belongs_to :user
  validates_uniqueness_of :memo_id, :scope => :user_id

  def activate_notification 
    self.notification = 'true'
    self.save
  end

end
