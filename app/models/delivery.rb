class Delivery < ApplicationRecord
  belongs_to :customer

  def full_address
    self.postcode + " " + self.address + " " + self.name
  end
  
  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
end
