require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do
    # @test = User.new({email: "jv.test@hotmail.com", first_name: "Joacquin", last_name: "Verdugo"})
    it "is not valid without name" do
      @test = User.new({email: "a@test.com", name: nil, password: "password22"})
      expect(@test).to_not be_valid
      expect(@test.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without email" do
      @test = User.new({email: nil, name: "Alice", password: "password22"})
      expect(@test).to_not be_valid
      expect(@test.errors.full_messages).to include("Email can't be blank")
    end
    it "is not valid when password is shorter than 10 characters" do
      @test_a = User.new({email: "a@test.com", name: "Alice", password: "password22"})
      @test_b = User.new({email: "a@test.com", name: "Alice", password: "password"})
      expect(@test_a).to be_valid
      expect(@test_b).to_not be_valid
      expect(@test_b.errors.full_messages).to include("Password is too short (minimum is 10 characters)")
    end
    it "is not valid when email is not unique" do
      @test_a = User.create!({email: "a@test.com", name: "Alice", password: "password22"})
      @test_b = User.new({email: "A@TEST.com", name: "Bob", password: "password23"})
      expect(@test_b).to_not be_valid
      expect(@test_b.errors.full_messages).to include("Email has already been taken")
    end
  end
end
