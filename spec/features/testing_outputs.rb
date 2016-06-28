require "rails_helper"

feature "Sales Taxes" do
  let(:order)     { create(:order) }

  #Product types
  let!(:other)     { create(:product_type, name: "Others") }
  let!(:books)     { create(:product_type, name: "Book") }
  let!(:food)      { create(:product_type, name: "Food") }
  let!(:medicine)  { create(:product_type, name: "Medical Product") }

  context "When I purchase items" do
    it "calculates the order for #input-1" do
      # "Quantity, Product, Price 
      # 1, book, 12.49 
      # 1, music cd, 14.99 
      # 1, chocolate bar, 0.85"

      book          = create(:product, product_type: books, price: 12.49)
      music_cd      = create(:product, product_type: other, price: 14.99)
      chocolate_bar = create(:product, product_type: food, price: 0.85)

      create(:line_item, product: book, order: order)
      create(:line_item, product: music_cd, order: order)
      create(:line_item, product: chocolate_bar, order: order)

      # Sales Taxes: 1.50 Total: 29.83

      expect(order.total).to eq(29.83)
      expect(order.taxes).to eq(1.50)

    end

    it "calculates the order for #input-2" do
      # "Quantity, Product, Price 
      # 1, imported box of chocolates, 10.00 
      # 1, imported bottle of perfume, 47.50"

      box_of_chocolates = create(:product, product_type: food, price: 10.00)
      bottle_of_perfume = create(:product, product_type: other, price: 47.50, imported: true)

      create(:line_item, product: box_of_chocolates, order: order)
      create(:line_item, product: bottle_of_perfume, order: order)

      # Sales Taxes: 7.65 Total: 65.15

      expect(order.total).to eq(65.15)
      expect(order.taxes).to eq(1.50)
    end

    it "calculates the order for #input-3" do
      # " Quantity, Product, Price 
      #  1, imported bottle of perfume, 27.99 
      #  1, bottle of perfume, 18.99
      #  1, packet of headache pills, 9.75
      #  1, box of imported chocolates, 11.25"

      bottle_of_perfume   = create(:product, product_type: other, price: 27.99, imported: true)
      bottle_of_perfume_2 = create(:product, product_type: other, price: 18.99)
      headache_pills      = create(:product, product_type: medicine, price: 9.75)
      box_of_chocolates   = create(:product, product_type: food, price: 11.25, imported: true)

      create(:line_item, product: bottle_of_perfume, order: order)
      create(:line_item, product: bottle_of_perfume_2, order: order)
      create(:line_item, product: headache_pills, order: order)
      create(:line_item, product: box_of_chocolates, order: order)

      #Sales Taxes: 6.70 Total: 74.68
      expect(order.total).to eq(74.68)
      expect(order.taxes).to eq(6.70)
    end
  end
end