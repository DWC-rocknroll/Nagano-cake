class OrderDetail < ApplicationRecord
  enum making_status: { impossible: 0, wait: 1, making: 2, complete: 3 }

  belongs_to :product
  
  validates :tax_in_price, presence: true
  validates :making_status, presence: true
end
