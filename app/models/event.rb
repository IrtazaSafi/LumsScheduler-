class Event < ActiveRecord::Base
	belongs_to :user
	attr_accessible :title, :ownerid, :starttime, :endtime, :duration, :location, :status, :description, :user_id

	#attr_protected :user_id

	

end
