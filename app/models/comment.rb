class Comment < ApplicationRecord
	belongs_to :dare
	belongs_to :user

	def self.generate_comment
	dare_id = Dare.pluck(:id).sample
  	text = Faker::Company.bs
  	commenter = User.pluck(:id).sample
  	user_id = User.pluck(:id).sample
  	Comment.create!(dare_id:     dare_id,
               user_id:     commenter,
               description: text)
  	end
end
