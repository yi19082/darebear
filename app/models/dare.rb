class Dare < ApplicationRecord
  belongs_to :dare_giver, class_name: :user
  belongs_to :dare_recepient, class_name: :user
end

