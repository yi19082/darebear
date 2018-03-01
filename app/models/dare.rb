class Dare < ApplicationRecord
  belongs_to :dare_giver, class_name: 'User'
  belongs_to :dare_recepient, class_name: 'User'
  acts_as_votable
  scope :pending, -> {where(accepted: nil)}
  scope :completed, -> {where(completed: true)}
  scope :accepted, -> {where(accepted: true)}
  def self.search(search_param)
  	Dare.where("description LIKE ?", "%#{search_param}%")
  end

  def dare_giver_name
    User.find(dare_giver_id).full_name
  end

  def dare_receiver_name
    User.find(dare_recepient_id).full_name
  end


  def self.generate_dare
  	receiver= User.pluck(:id).sample
  	giver = User.pluck(:id).sample
  	upvote_count =(1..10).to_a.sample
  	accepted = [true, false].sample
  	if accepted
  		completed =[true, false].sample
  	else
  		completed =false
  	end
  	description =Faker::HowIMetYourMother.quote
  	Dare.create!(dare_giver_id:     giver,
               dare_recepient_id:     receiver,
               upvote_count: upvote_count,
               completed:    completed,
               accepted: accepted,
               description: description)
  end
end


