class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags , through: :taggings #if we have an object named tag we can ask for tag.articles.

	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ") #When we joined the array Ruby called the default #to_s method on every one of these Tag instances 
	end

	def tag_list=(tags_string)
		#The String#strip method removes leading or trailing whitespace 
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end
end
