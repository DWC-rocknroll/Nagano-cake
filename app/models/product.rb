class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  attachment :image
  def add_tax_tax_out_price
    (self.tax_out_price * 1.10).round
  end
end
