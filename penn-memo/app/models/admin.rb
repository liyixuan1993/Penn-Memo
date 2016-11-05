class Admin < ApplicationRecord
	# attr_accessor :Author, :Title,:tag, :Content, :file

	validates :Author, :presence => true
	validates :Title, :presence => true
	validates :Content, :presence => true
end
