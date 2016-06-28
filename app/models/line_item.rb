class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity, :price, presence: true

  before_save :calculate_price

private
  def calculate_price
    self.price = Taxes::Calculator.new(product).calculate
  end
end
