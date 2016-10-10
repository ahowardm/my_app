require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: "race bike")
      #@user = User.create!(first_name: "Ricardo", last_name: "Claro", email: "ricaro@claro.com", password: "hola00")
      user = FactoryGirl.build(:user)
      @product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: user, body: "Regular bike!")
      @product.comments.create!(rating: 5, user: user, body: "Nice bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.comments.average(:rating)).to eq 3
    end

    it "is not valid" do
      expect(Product.new(description: "Nice Bike")).not_to be_valid
    end
  end
end
