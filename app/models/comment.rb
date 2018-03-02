class Comment < ApplicationRecord
	belongs_to :dare
	belongs_to :commenter, :class_name => "User"

	def self.generate_comment
	dare_id = Dare.pluck(:id).sample
  	text = Faker::Company.bs
  	commenter = User.pluck(:id).sample
  	user_id = User.pluck(:id).sample
  	Comment.create!(dare_id:     dare_id,
               commenter_id:     commenter,
               description: text)
  	end
end
