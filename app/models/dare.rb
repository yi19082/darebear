class Dare < ApplicationRecord
  belongs_to :dare_giver, class_name: 'User'
  belongs_to :dare_recepient, class_name: 'User'
  acts_as_votable
  scope :pending, -> {where(accepted: nil)}
end

