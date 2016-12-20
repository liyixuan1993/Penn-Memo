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
  belongs_to :tag
  has_many :unreads

  has_many :responses
  has_many :memos, through: :responses
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["application/pdf", "image/jpeg", "image/gif", "image/png"] }

  def self.search(search)
    where("LOWER(content) LIKE ? OR LOWER(title) LIKE ? OR LOWER(author) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end



end
