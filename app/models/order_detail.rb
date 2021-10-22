class OrderDetail < ApplicationRecord
  enum making_status: { impossible: 0, wait: 1, making: 2, complete: 3 }
  
  belongs_to :order_detail
  belongs_to :product
end
