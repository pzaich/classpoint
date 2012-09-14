module ApplicationHelper
	def insert_avatar(user)
		image_tag "http://avatars.io/auto/#{user.username}", :height => 40 , :width => 40, :class => 'avatar'
	end
end
