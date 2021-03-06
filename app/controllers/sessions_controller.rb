class SessionsController < ApplicationController
	include SessionFailsConcern
	
	def index
	end

	def create
		@user = User.find_by(username:login_params[:username])

		if !@user.nil?
			verify_user_status(@user)
			if @user.password === login_params[:password]
				session[:user_id] = @user.id
				restart_user_fails(@user)
			else
				verify_user_fails(@user)
			end	
		else
			flash[:login_errors] = 'User does not exists'
			redirect_to sign_in_path
		end	
	end

	def destroy
    session[:user_id] = nil  
    flash[:logout_success] = 'You success sign out'      
    redirect_to sign_in_path
  end 

	private
	
	def login_params
		params.require(:login).permit(:username, :password)
	end
end
