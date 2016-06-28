class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, through: :line_items

  def total
    line_items.collect{|li| li.price}.inject(&:+)
  end

  def taxes 
    total - total_without_taxes
  end

private
  def total_without_taxes
    products.collect{|product| product.price}.inject(&:+)
  end
end
