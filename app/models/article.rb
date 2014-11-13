class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy #association with model Comment
						#  dependent: :destroy  -> ensure that when we delete an article, all associated comments will be deleted as well
	#These two declarations enable a good bit of automatic behavior. 
	#For example, if you have an instance variable @article containing an article, 
	#you can retrieve all the comments belonging to that article as an array using @article.comments.
	validates :title, presence: true,
						length: { minimum: 5 }
end
