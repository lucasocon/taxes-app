require 'rails_helper'

RSpec.describe LineItem, type: :model do

  describe "Associations" do
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end

  describe "Validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:price) }
  end

  describe "Factory" do
    it "creates a valid line item" do
      expect(create(:line_item)).to be_valid
    end
  end

  describe "#price" do
    it "should calculate the price when no taxes applies" do
      book      = create(:product_type, name: "Book")
      book_item = create(:product, product_type: book, price: 19.90)

      line_item = create(:line_item, product: book_item)

      expect(line_item.price).to eq(book_item.price)
    end

    it "should calculate the price with common taxes" do
      product = create(:product, price: 20.89)
      line_item = create(:line_item, product: product)

      expected_price = ((20.89 * 1.1) * 20.0).ceil.to_f / 20.0

      expect(line_item.price).to eq (expected_price)
    end

    it "should calculate the price for imported products" do
      product = create(:product, price: 32.19, imported: true)
      line_item = create(:line_item, product: product)

      expected_price = ((32.19 * 1.15) * 20.0).ceil.to_f / 20.0

      expect(line_item.price).to eq (expected_price)
    end
  end

end
