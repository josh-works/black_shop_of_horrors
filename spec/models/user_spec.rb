require 'rails_helper'

RSpec.describe User do
  context "roles" do
    it "default role" do
      user = User.create!(email: "seth@seth.com",
                   first_name: "seth",
                   last_name: "seth",
                   password: "banana1",
                   password_confirmation: "banana1")

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it "can be set as admin role" do
      user = User.create!(email: "seth@seth.com",
                   first_name: "seth",
                   last_name: "seth",
                   password: "banana1",
                   password_confirmation: "banana1",
                   role: 1)

      expect(user.role).to eq("admin")
      expect(user.default?).to be_falsy
    end
  end

  context "validations" do
    it "is valid with all attributes" do
      user = User.new(email: "seth@seth.com",
      first_name: "seth",
      last_name: "seth",
      password: "banana1",
      password_confirmation: "banana1")

      expect(user).to be_valid
    end

    it "is invalid without email" do
      user = User.new(
      first_name: "seth",
      last_name: "seth",
      password: "banana1",
      password_confirmation: "banana1")

      expect(user).to_not be_valid
    end

    it "is invalid without unique email" do
      User.create!(email: "sethd",
                first_name: "seth",
                last_name: "seth",
                password: "banana1",
                password_confirmation: "banana1")
      invalid = User.new(email: "sethd",
                first_name: "seth",
                last_name: "seth",
                password: "banana1",
                password_confirmation: "banana1")

      expect(invalid).to_not be_valid
    end

    it "is invalid without password" do
      user = User.new(email: "set@set.com",
      first_name: "seth",
      last_name: "seth")

      expect(user).to_not be_valid
    end

    it "is invalid without first name" do
      user = User.new(email: "seth@seth.com",
      last_name: "seth",
      password: "banana1",
      password_confirmation: "banana1")

      expect(user).to be_invalid
    end

    it "is invalid without last name" do
      user = User.new(email: "seth@seth.com",
      first_name: "seth",
      password: "banana1",
      password_confirmation: "banana1")

      expect(user).to be_invalid
    end
  end
end
