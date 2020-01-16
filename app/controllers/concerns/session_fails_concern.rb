module SessionFailsConcern
  extend ActiveSupport::Concern

  def verify_user_status(user)
  	if user.status.eql?('blocked')
  		flash[:login_errors] = "Your account has been blocked"
      redirect_to sign_in_path
    end
  end

  def block_user(user)
  	user.update(status: 'blocked')
    flash[:login_errors] = "Your account has been blocked"
    redirect_to sign_in_path
  end

  def verify_user_fails(user)  
    if user.fails < 2
    	user_fails = user.fails + 1
  		user.update(fails: user_fails)
      flash[:login_errors] = 'invalid credentials, ' + (3 - user_fails).to_s + ' chances more'	
      redirect_to sign_in_path
    else
    	block_user(user) if !user.status.eql?('blocked')
    end
  end

  def restart_user_fails(user)
    if !user.status.eql?('blocked')
      user.update(fails: 0)  
      flash[:login_success] = "Welcome #{@user.username}"
      redirect_to dashboard_path
    end
  end

end