require 'rails_helper'
describe Product do
	context "when the product has comments" do
		before do
  		@product = Product.create!(name: "race bike")
  		@user = FactoryGirl.create(:user)
  		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
  		@product.comments.create!(rating: 3, user: @user, body: "Just another bike")
  		@product.comments.create!(rating: 5, user: @user, body: "Greatest bike ever!")
		end
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
	end

	context "when the product name is missing" do
    before do
      @invalid_product = Product.new(description: "This is a nameless bike.")
    end

    it "is not valid" do
      expect(@invalid_product).not_to be_valid
    end
  end


end