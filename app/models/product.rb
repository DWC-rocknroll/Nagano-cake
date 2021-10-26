class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  attachment :image
  def add_tax_tax_out_price
    (self.tax_out_price * 1.10).round
  end
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :tax_out_price, presence: true
  validates :is_sale_active, inclusion: [true, false]
end
