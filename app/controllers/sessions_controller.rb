class SessionsController < ApplicationController
	skip_before_action :login_required, :only => [:new, :create]

	def new
		render :new
	end

  def create
  	byebug
  	@user = User.find_by(email: params[:session][:sign_in]) || User.find_by(username: params[:session][:sign_in])

    if @user && @user.authenticate(params[:session][:password])
    	byebug
			session[:remember_token] = @user.remember_token
      redirect_to home_path, notice: 'User has successfully signed in.'
    else
    	flash.now.alert = "Invalid email or password"
    	render :new
    end
  end

  def destroy
  	byebug
  	reset_session

  	redirect_to sign_in_path
  end

end
