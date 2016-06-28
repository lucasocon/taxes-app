class Taxes::Policy

  def initialize(product)
    @product = product
  end

  def check
    return (common_tax_rate + imported_tax_rate).to_f
  end

  def common_tax_rate
    return 0 if is_a_exception
    10
  end

  def imported_tax_rate
    return 5 if is_imported
    0
  end

private

  def is_a_exception
    true if @product.type.in? exception_list
  end

  def is_imported
    true if @product.imported?
  end

  def exception_list
    ["Book", "Food", "Medical Product"]
  end

end