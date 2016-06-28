class Taxes::Calculator

  def initialize(product)
    @product     = product
    @shelf_price = product.price
    @precision   = 0.05
  end

  def calculate
    rounded(price_with_taxes)
  end

private
  def taxes
    tax_percentage = Taxes::Policy.new(@product).check
    @shelf_price * tax_percentage / 100.0
  end

  def price_with_taxes
    @shelf_price + taxes
  end

  def rounded(price)
    (price * (1 / @precision)).ceil / (1 / @precision)
  end

end