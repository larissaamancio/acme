# encoding: utf-8

class TasksController < ApplicationController
	before_action :authenticate_user!

	def create
		@task = Task.new(task_params)
		@task.save
	end

	private

	  def task_params
	    params.require(:task).permit(:text, :list_id)
	    # params.permit(:name, :privacy)

	  end


end
