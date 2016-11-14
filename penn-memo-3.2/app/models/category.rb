class Category < ActiveRecord::Base
	has_many :memos
	has_many :users
end
