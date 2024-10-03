require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:tenant) { create(:tenant, name: "Exon") }
  let!(:user) { create(:user, email: "sandesh@gmail.com", password: "121212", tenant: tenant) }

  let(:product) { tenant.products.build(name: "petrol", user: user) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:tenant) }
    it { should have_many(:line_items) }
  end

  describe "validations" do
    it "validates uniqueness of name" do
      product.save!
      duplicate_product = tenant.products.build(name: "petrol", user: user)

      expect(duplicate_product).to_not be_valid
      expect(duplicate_product.errors[:name]).to include("Product already exist.")
    end

    it "validates that name must not contain spaces" do
      product_with_spaces = tenant.products.build(name: " Product", user: user)
      expect(product_with_spaces).to_not be_valid
      expect(product_with_spaces.errors[:name]).to include("must not contain spaces.")
    end

    it "is valid with a unique name without spaces" do
      expect(product).to be_valid
    end
  end
end
