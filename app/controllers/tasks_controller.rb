# encoding: utf-8
class TasksController < ApplicationController
	before_action :authenticate_user!

	def create
		@task = Task.new(task_params)
		@task.save!

		respond_to do |format|
			format.js
		end
	end

	def get_tasks_by_list_id 
    @tasks = Task.where(:list_id => params[:list_id]) if params[:list_id].present?
    render :partial => "tasks/task_view", :layout => false
  end

	private

	  def task_params
	    params.require(:task).permit(:text, :list_id)
	  end
end

