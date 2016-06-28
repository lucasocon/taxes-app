require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { create(:product) }

  describe "Associations" do
    it { should belong_to(:product_type) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  describe "Factory" do
    it "creates a valid product" do
      expect(create(:product)).to be_valid
    end
  end

end
