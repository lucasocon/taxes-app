require 'rails_helper'

RSpec.describe ProductType, type: :model do
  let!(:product_type) { create(:product_type) }

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Factory" do
    it "creates a valid product type" do
      expect(create(:product_type)).to be_valid
    end
  end
end
