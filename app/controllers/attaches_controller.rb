class AttachesController < ApplicationController

	before_action :set_task

  def create
    add_more_attaches(attaches_params[:attaches])
    flash[:error] = "Failed uploading images" unless @task.save
    redirect_to task_path(@task)
  end

  def destroy
    remove_avatar_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @task.save
    redirect_to task_path(@task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def add_more_attaches(new_attaches)
    attaches = @task.attaches # copy the old images 
    attaches += new_attaches # concat old images with new ones
    @task.attaches = attaches # assign back
  end

  def attaches_params
    params.require(:task).permit({attaches: []}) # allow nested params as array
  end

end
