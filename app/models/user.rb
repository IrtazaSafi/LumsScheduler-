class User < ActiveRecord::Base

	has_many :events
	has_many :friends
	attr_accessible :uid, :provider, :name,:first_name,:last_name,:about,:gender,:work,:email,:education
	def self.create_with_omniauth(auth)
		User.create!(
			:provider => auth["provider"],
			:uid => auth["uid"],
			:name => auth["info"]["name"],
			:first_name => auth["info"]["first_name"],
			:last_name => auth["info"]["last_name"],
			:about => auth["info"]["about"],
			:gender => auth["extra"]["raw_info"]["gender"],
			:work => auth["info"]["work"],
			:email => auth["info"]["email"],
			:education => auth["info"]["education"])

	end
end
