require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validation" do

    it "is valid with correct attribute" do
      @user = User.create(name: "chris green", email: "green@gmail.com", contact_number: "8889506146", password: "123456")
      expect(@user.save).to eq(true)
    end

    it "is not valid without name" do
      @user = User.create(name: nil, email: "mm@gmail.com", contact_number: "7000958274", password: "password")
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without email" do
      @user = User.create(name: "mayank", email: nil, contact_number: "7000958274", password: "password")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid without password" do
      @user = User.create(name: "mayank", email: "spl@gmail.com", contact_number: "7000958274", password: nil)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "is not valid without perfect email format" do
      @user = User.create(name: "mayank", email: "mayank", contact_number: "7000958274", password: "password")
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "is not valid without perfect email format" do
      @user = User.create(name: "mayank", email: "@.com", contact_number: "7000958274", password: "password")
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "is not valid without  unique email address" do
      User.create(name: "mayank", email: "ss@gmail.com", contact_number: "7000958274", password: "700095")
      @user = User.create(name: "mayank", email: "ss@gmail.com", contact_number: "7000958274", password: "700095")
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it "is not valid without contact number" do
      @user = User.create(name: "mayank", email: "ss@gmail.com", contact_number: nil, password: "password")
      expect(@user.errors.full_messages).to include("Contact number can't be blank")
    end

    it "contact number is not valid without numeric value " do
      @user = User.create(name: "mayank", email: "anuj@gmail.com", contact_number: "abc", password: "700095")
      expect(@user.errors.full_messages).to include("Contact number is not a number")
    end

    it "contact number is not valid without length less than 10" do
      @user = User.create(name: "mayank", email: "anuj@gmail.com", contact_number: "857", password: "700095")
      expect(@user.errors.full_messages).to include("Contact number is too short (minimum is 10 characters)")
    end

  end

end
