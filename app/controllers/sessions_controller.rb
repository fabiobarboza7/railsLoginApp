class SessionsController < ApplicationController
	def create
		@user = User.find_by(username:login_params[:username])
		if !@user.nil?
			if @user.password === login_params[:password]
				session[:user_id] = @user.id
				flash[:login_success] = ["Welcome #{@user.username}"]
				redirect_to dashboard_path
			else
				flash[:login_errors] = ['invalid credentials']
				redirect_to sign_in_path
			end	
		else
			flash[:login_errors] = ['User does not exists']
			redirect_to sign_in_path
		end	
	end

	def destroy
    session[:user_id] = nil         
    redirect_to sign_in_path
  end 

	private
	
	def login_params
		params.require(:login).permit(:username, :password)
	end
end
