class Restaurant < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  has_many :foods, dependent: :delete_all

  #VALIDATIONS
  validates :name, :address, presence: true
  
end
