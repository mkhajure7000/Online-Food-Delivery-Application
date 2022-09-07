class Restaurant < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  has_many :foods, dependent: :delete_all
  has_one_attached :image  
  #VALIDATIONS
  validates :name, :address, presence: true

end
