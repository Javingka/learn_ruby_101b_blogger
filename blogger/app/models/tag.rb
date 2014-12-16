class Tag < ActiveRecord::Base
	has_many :taggings 
	has_many :articles, through: :taggings #Now if we have an object like article we can just ask for article.tags 
end
