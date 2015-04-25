class User < ActiveRecord::Base

	has_many :events
	attr_accessible :uid, :provider, :name
	def self.create_with_omniauth(auth)
		User.create!(
			:provider => auth["provider"],
			:uid => auth["uid"],
			:name => auth["info"]["name"])
	end
end
