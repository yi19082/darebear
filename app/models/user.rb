
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :dares_to_give, class_name: 'Dare', foreign_key: 'dare_giver_id'
  has_many :dares_to_receive, class_name: 'Dare', foreign_key: 'dare_recepient_id'

  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  def self.search(search_param)
    User.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{search_param}%", "%#{search_param}%", "%#{search_param}%")
  end

  def full_name
    "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}"
  end

  def self.generate_user
  password = "foobar"
  first_name     = Faker::Name.first_name
  last_name    = Faker::Name.last_name
 
  email    = Faker::Internet.email
  User.create!(first_name:     first_name,
               last_name:     last_name,
               password: password,
               email:    email )
   
  end
  
end
