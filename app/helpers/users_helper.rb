module UsersHelper
	# 返回指定用户的 Gravatar 
	def gravatar_for(user,options = {size: 40 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = user.cover
        image_tag(gravatar_url, alt: user.name, class: "gravatar",size:10*10)
    end
end
