module SessionsHelper
	def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
		!current_user.nil?

    if current_user
      if current_user.status === 'blocked' 
        flash[:login_errors] = "Your account has been blocked"
         redirect_to sign_in_path
      else
        true
      end
    end
  end

  def logged_in_user
    unless logged_in?
       flash[:login_errors] = "Please log in."
       redirect_to sign_in_path
    end
  end
end
