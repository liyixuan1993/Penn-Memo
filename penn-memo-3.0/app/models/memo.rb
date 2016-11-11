class Memo < ActiveRecord::Base

	validates :author, :presence => true
	validates :title, :presence => true
	validates :content, :presence => true
	belongs_to :category
	delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
