require'rails_helper'


RSpec.describe "validations" do
  context "is valid" do
    it "is valid with all attributes" do
      category = Category.create(title: "Seth's organs", image: "https://www.sethsorgans.com")

      expect(category).to be_valid
      expect(category.title).to eq("Seth's organs")
    end
  end

  context "is not valid without all attributes" do
    it "is not valid without image url" do
      category = Category.create(title: "Seth's organs")

      expect(category).to be_invalid
    end

    it "is not valid withotu title" do
      category = Category.create(image: "https://www.sethsorgans.com")

      expect(category).to be_invalid
    end
  end

  context "is not valid if it's not unique" do
    it "isn't valid if title is not unique" do
      category1 = Category.create(title: "Seth's organs", image: "https://www.sethsorgans.com")
      category2 = Category.create(title: "Seth's organs", image: "https://www.sethsasdfasdforgans.com")

      expect(category1).to be_valid
      expect(category2).to be_invalid
    end

    it "isn't valid if image is not unique" do
      category1 = Category.create(title: "Seth's organs", image: "https://www.sethsorgans.com")
      category2 = Category.create(title: "Josh's left leg", image: "https://www.sethsorgans.com")

      expect(category1).to be_valid
      expect(category2).to be_invalid
    end
  end
end
