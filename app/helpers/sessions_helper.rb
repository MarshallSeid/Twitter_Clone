module SessionsHelper
  # logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # returns the current logged-in user (if any)
  # Study ||= which is == to @foo = @foo || "bar", @foo ||= "bar "
  def current_user
    if (user_id = session[:user_id]) # This is an assignment if session of user id exists
      current_user ||= User.find_by(id: session[:user_id]) 
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # Returns true if user is logged in == current user isn't nil
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Forgets a persistent user 
  def forget (user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end