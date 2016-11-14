class Memo < ActiveRecord::Base

	validates :author, :presence => true
	validates :title, :presence => true
	validates :content, :presence => true
	validates_length_of :content, :minimum => 10

	belongs_to :category
	delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
