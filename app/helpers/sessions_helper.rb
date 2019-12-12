module SessionsHelper

  def log_in(user)
      session[:user_id] = user.id
      session[:expires_after] = 1.hour.from_now.to_i

  end

  # Logs in the given user.
  #def log_in(user)
  #  session[:user_id] = user.id
  #end

  # Returns the current logged-in user (if any).
 def current_user
   @current_user ||= User.find_by(id:session[:user_id])
 end

 def admin?
    @current_user ||= User.find_by(id:session[:user_id])
    if @current_user.Admin_rights == true
      return true
    else
      redirect_to "/pages/denied"
    end
  end

 # Returns true if the user is logged in, false otherwise.
 def logged_in?
  unless User.find_by(id: session[:user_id]) && session[:expires_after] && session[:expires_after] > Time.now.to_i
    unless User.find_by(id: session[:user_id])
      notice = "Please log in"
    else
      unless session[:expires_after] && session[:expires_after] > Time.now.to_i
      log_out
      notice = "Your session has expired, plese log in again"
      end
    end
  redirect_to login_url, notice:notice
  end
 end

 # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
