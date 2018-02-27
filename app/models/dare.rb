class Dare < ApplicationRecord
  belongs_to :dare_giver, class_name: 'User'
  belongs_to :dare_recepient, class_name: 'User'

  scope :pending, -> {where(accepted: nil)}
end

