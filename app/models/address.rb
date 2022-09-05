class Address < ApplicationRecord

  #Associations
  belongs_to :user

  #VAlidations
  validates :area, :city, :state, presence: true
  validates :pincode, :format => { :with => /\A(\+1)?[0-9]{6}\z/, :message => "Not a valid pincode" }

end
