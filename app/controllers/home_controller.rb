class HomeController < ApplicationController
	skip_before_action :login_required, :only => [:index]

  def index
  	@lists = current_user.lists
  	@tasks = current_user.tasks
  	@tags = List.tag_counts_on(:tags)
  end
end
