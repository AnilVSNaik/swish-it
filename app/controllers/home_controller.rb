class HomeController < ApplicationController

  def index
  	@lists = current_user.lists
  	@tasks = current_user.tasks
  	@tags_arr = []
  	@lists.each { |list| list.tag_list.each {|tag| @tags_arr << tag} }
  	@tags = @tags_arr.uniq
  end
end
