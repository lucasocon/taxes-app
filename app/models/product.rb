class Product < ActiveRecord::Base
  belongs_to :product_type
  has_many :line_items

  validates :name, :price, :product_type, presence: true

  def type
    product_type.name
  end

end
