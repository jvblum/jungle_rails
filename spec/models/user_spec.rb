require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do
    # @test = User.new({email: "jv.test@hotmail.com", first_name: "Joacquin", last_name: "Verdugo"})
    it "is not valid without name" do
      @test = User.new({email: "jv.test@hotmail.com", name: nil})
      expect(@test).to_not be_valid
    end
    it "is not valid without email" do
      @test = User.new({email: nil, name: "Joacquin"})
      expect(@test).to_not be_valid
    end
    it "is not valid when password is shorter than 10 characters" do
      @test = User.new({email: nil, name: "Joacquin", password: "password"})
      # length: { minimum: 5 }
    end
  end
end
