require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "Factory" do
    it "creates a valid product" do
      expect(create(:order)).to be_valid
    end
  end

end
