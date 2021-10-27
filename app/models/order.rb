class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirm: 1, making: 2, prepare: 3, finish: 4 }

  belongs_to :customer, optional: true
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

end
