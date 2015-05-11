class Friend < ActiveRecord::Base
	belongs_to :user
	attr_accessible :uid, :provider, :name,:first_name,:last_name,:about,:gender,:work,:email,:education, :user_id

end
