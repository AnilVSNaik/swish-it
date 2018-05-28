class SessionsController < ApplicationController
	skip_before_action :login_required, :only => [:new, :create, :create_from_omniauth]

	def new
		render :new
	end

  def create
  	@user = User.find_by(email: params[:session][:sign_in]) || User.find_by(username: params[:session][:sign_in])

    if @user && @user.authenticate(params[:session][:password])
    	sign_in(@user)
      redirect_to home_path, notice: 'User has successfully signed in.'
    else
    	flash.now.alert = "Invalid email or password"
    	render :new
    end
  end

  def destroy
  	sign_out
  	redirect_to sign_in_path
  end

  def create_from_omniauth
  	byebug
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

    # if: previously already logged in with OAuth
    if authentication.user
    	byebug
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = home_url
      flash[:success], @notice = "Signed in!"
    # else: user logs in with OAuth for the first time
    else
    	byebug
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # you are expected to have a path that leads to a page for editing user details
      @next = edit_user_path(user)
      @notice = "User created. Please confirm or edit details"
    end

    sign_in(user)
    redirect_to @next, :notice => @notice
  end

  private

  def sign_in(user)
  	session[:remember_token] = user.remember_token
  end

  def sign_out
  	reset_session
  end

end
