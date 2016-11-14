class Tag < ActiveRecord::Base
	has_many :user_tagships
	has_many :users, :through => :user_tagships
end
