class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  validates :quantity, :customer_id, :product_id, presence: true
end
