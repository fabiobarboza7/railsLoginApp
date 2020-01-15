module SessionsHelper
	def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
		!current_user.nil?
  end

  def logged_in_user
    unless logged_in?
       flash[:login_errors] = ["Please log in."]
       redirect_to '/'
    end
  end
end
