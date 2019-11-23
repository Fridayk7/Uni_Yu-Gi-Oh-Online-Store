module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
 def current_user
   @current_user ||= User.find_by(id:session[:user_id])
 end

 def admin?
    @current_user ||= User.find_by(id:session[:user_id])
    if @current_user.email == "admin@amdin.com"
      return true
    else
      redirect_to "/pages/denied"
    end
  end

 # Returns true if the user is logged in, false otherwise.
 def logged_in?
   unless User.find_by(id: session[:user_id])
    redirect_to login_url, notice:"Please log in"
  end
 end

 # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
