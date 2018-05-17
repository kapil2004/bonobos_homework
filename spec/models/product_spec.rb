require "rails_helper"

RSpec.describe Product, type: :model do

  describe "search" do
    before(:each) do
      ["washed chinos", "jetsetter jeans", "travel jeans", "fireside flannels"].each do |name|
        Product.create(name: name)
      end
    end

    context "when search term is empty" do
      it "should return nil" do
        expect(Product.search("")).to be_nil
      end
    end

    context "when search term exactly matches a product name" do
      it "should return the product with the same name" do
        product = Product.where(name: "jetsetter jeans").first
        expect(Product.search("jetsetter jeans")).to eq product
      end
    end

    context "when search term doesn't exactly match a product name" do
      it "should return the best matched product" do
        product = Product.where(name: "washed chinos").first
        expect(Product.search("washed chimps")).to eq product
        expect(Product.search("wish")).to eq product

        p1 = Product.where(name: "jetsetter jeans").first
        p2 = Product.where(name: "travel jeans").first
        expect(Product.search("jeans")).to eq p2
      end
    end
  end
end
