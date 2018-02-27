class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :dares_to_give, class_name: 'Dare', foreign_key: 'dare_giver_id'
  has_many :dares_to_receive, class_name: 'Dare', foreign_key: 'dare_recepient_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  def full_name
    "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}"
  end

  def pending_dares
    dares_to_receive.pending
  end
end
