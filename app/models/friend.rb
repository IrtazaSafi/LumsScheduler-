class Friend < ActiveRecord::Base
	belongs_to :user
	attr_accessible :uid, :provider, :name,:first_name,:last_name,:about,:gender,:work,:email,:education, :user_id
	def self.getHash (_name)
		friend_to_add = User.find_by_name(_name);
		hash = {:uid => friend_to_add.uid, :provider=>friend_to_add.provider, 
			:name=>friend_to_add.name,:first_name=>friend_to_add.first_name,
			:last_name=>friend_to_add.last_name,:about=>friend_to_add.about,
			:gender=>friend_to_add.gender,:work=>friend_to_add.work,
			:email=>friend_to_add.email,:education=>friend_to_add.education}
			# :user_id => params[:id]}
			return hash
	end
end
