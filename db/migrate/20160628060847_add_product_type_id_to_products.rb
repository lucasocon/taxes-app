class AddProductTypeIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_type, index: true, foreign_key: true
  end
end
