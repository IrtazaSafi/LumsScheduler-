class User < ActiveRecord::Base

	def User.initialize(provider,uid,name)
		@provider = provider
		@uid = uid
		@name = name
	end

	def self.id
		self.id
	end

	def self.create_with_omniauth(auth)
		User.initialize(auth['provider'],auth['uid'],auth['info']['name'])
	end
end
