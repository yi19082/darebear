class Dare < ApplicationRecord
  belongs_to :dare_giver, class_name: 'User'
  belongs_to :dare_recepient, class_name: 'User'
  acts_as_votable
  scope :pending, -> {where(accepted: nil)}


  def self.search(params)

  	dares=Dare.where("description like ?", "%#{params[:search]}") if params[:search].present?
  	return dares
  	print "we got data"
  	print "my man", dares.size

  end
end

