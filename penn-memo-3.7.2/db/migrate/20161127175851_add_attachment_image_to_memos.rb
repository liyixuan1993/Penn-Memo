class AddAttachmentImageToMemos < ActiveRecord::Migration
  def self.up
    change_table :memos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :memos, :image
  end
end
