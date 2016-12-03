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

require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
