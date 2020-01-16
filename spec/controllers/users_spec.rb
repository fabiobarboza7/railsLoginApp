require 'rails_helper'

	describe SessionsController, :type => :controller do 
		context 'POST #create' do 
			it 'should create a session and redirect_to dashboard' do
				user = User.create!(username: "fabio", password: "123123")
				post :create, params: { login: {username: user.username, password: user.password} }
				expect(response).to redirect_to(dashboard_path)
			end
		end

		context 'POST #create' do 
			it 'should redirect when trying to create a session with wrong password' do
				user = User.create!(username: "fabio", password: "123123")
				post :create, params: { login: {username: "321321", password: user.password} }
				expect(response).to redirect_to(sign_in_path)
			end
		end

		context 'POST #create' do 
		it 'should pass when trying to create a session with fails chance' do
			user = User.create!(username: "fabio", password: "123123", fails: 2)
			expect(user).to have_attributes(status: "active")
		end
	end
end
