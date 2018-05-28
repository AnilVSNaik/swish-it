class HomeController < ApplicationController
	skip_before_action :login_required, :only => [:index]

  def index
  end
end
