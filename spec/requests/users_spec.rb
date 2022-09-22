require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "POST: create" do

    before(:each) do
      @user = User.create(name: "mayank", email: "mayankkhajure@gmail.com", contact_number: "7000958274", password: "12345", is_admin: true)
    end

  
    it "is creates an user" do
      params = {
        user: {
          name: "mayank",
          email: "aaa@gmail.com",
          contact_number: "7000958274",
          password: "123456",
          is_admin: true
        }
      }
      post users_path, params: params
      expect(response.status).to eq(302)
    end

    it "is failed to creates an user" do
      params = {
        user: {
          name: "",
          email: "aaa@gmail.com",
          contact_number: "7000958274",
          password: "123456",
          is_admin: true
        }
      }
      post users_path, params: params
      expect(response.status).to eq(422)
    end

  end

end
