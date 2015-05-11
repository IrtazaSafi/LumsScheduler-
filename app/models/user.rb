class User < ActiveRecord::Base

	has_many :events
	attr_accessible :uid, :provider, :name,:first_name,:last_name,:about,:gender,:work,:email,:education
	def self.create_with_omniauth(auth)
		User.create!(
			:provider => auth["provider"],
			:uid => auth["uid"],
			:name => auth["info"]["name"],
			:first_name => auth["info"]["first_name"],
			:last_name => auth["info"]["last_name"],
			:about => auth["info"]["about"],
			:gender => auth["info"]["gender"],
			:work => auth["info"]["work"],
			:email => auth["info"]["email"],
			:education => auth["info"]["education"])

	end
end
