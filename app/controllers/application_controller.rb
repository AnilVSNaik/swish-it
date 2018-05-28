class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :login_required

  #This method checks if we have a user signed in
  def login_required
    if !signed_in?
      redirect_to sign_in_path, :notice => "Log in to edit or delete your post"
    end
  end

  def signed_in?
    !!current_user
  end

  helper_method :signed_in?

  #This method gives us details about our user
  def current_user
    if session[:remember_token]
      @current_user = User.find_by(remember_token: session[:remember_token])
      @current_user
    else
      false
    end
  end

  helper_method :current_user

end
