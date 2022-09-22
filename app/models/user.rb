class User < ApplicationRecord
  has_secure_password
  
  # ASSOCIATIONS
  has_many :restaurants 
  has_many :addresses
  #VALIDATIONS
  validates :name, :email, :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, uniqueness: true
  validates :contact_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10 }

end
