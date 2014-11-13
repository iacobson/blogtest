class Comment < ActiveRecord::Base
  belongs_to :article	#Association to model Article
end
