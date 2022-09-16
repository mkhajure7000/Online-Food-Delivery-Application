class User < ApplicationRecord
  has_secure_password
  
  # ASSOCIATIONS
  has_many :restaurants 
  has_many :addresses
  has_one :cart
  
  #VALIDATIONS
  validates :name, :email, :password, :contact_number, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates :email, uniqueness: true
  
  def get_cart
    cart || create_cart
  end

end
