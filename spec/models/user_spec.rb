require 'rails_helper'

RSpec.describe User, type: :model do
	it "should not save empty username column" do
		expect(User.create(username: "", password: "123123")).to_not be_valid
	end

	it "should not save empty password column" do
		expect(User.create(username: "fabio", password: "")).to_not be_valid
	end
end