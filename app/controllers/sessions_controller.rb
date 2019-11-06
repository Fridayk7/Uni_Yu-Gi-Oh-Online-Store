class SessionsController < ApplicationController
  skip_before_action :logged_in?
  def new
  end
  def create
      user =User.find_by(email: params[:session][:email].downcase)
      if user &&user.authenticate(params[:session][:password])
        # Log theuser in and redirect them to the user’s show page.
        log_in(user)
        redirect_to user
      else
        # Create an error message.
       flash[:notice] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    end

    def destroy
       log_out
       redirect_to root_url
  end
end
