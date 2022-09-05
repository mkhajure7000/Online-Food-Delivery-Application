class Restaurant < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  has_many :foods 

  #VALIDATIONS
  validates :name, :address, presence: true
  
end
