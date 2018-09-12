require 'rails_helper'

describe Product do
  context "when the a product has rated comments" do
    let(:product) { Product.create!(name: "race bike")}
    let(:user) { User.create!(email: "example-email@gmail.com", password: "password-example")}

    before do
      product.comments.create!(rating: 1, user: user, body: "God awful pop!")
      product.comments.create!(rating: 5, user: user, body: "Best pop ever!")
      product.comments.create!(rating: 3, user: user, body: "Not the worst pop")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3.0
    end

    it "returns the lowest rated comment rating" do
      expect(product.lowest_rating_comment.rating).to eq 1.0
    end

    it "returns the highest rated comment rating" do
      expect(product.highest_rating_comment.rating).to eq 5.0
    end
  end

  it "product without a name is not valid" do
    expect(Product.new(description: "Coolio pop")).not_to be_valid
  end
end
