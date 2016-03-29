# encoding: utf-8
class ListsController < ApplicationController
	before_action :authenticate_user!

	def new
		@list = current_user.lists.build
	end

	def create
		@list = current_user.lists.create(list_params)

    @list.user_id = current_user.id
    @list.save

		redirect_to do |format|
	   	format.js
	  end
	end

	def show
	end

	def index
		@lists = current_user.lists.includes(:tasks, :user).paginate(:page => params[:page], :per_page => 5)
	end

	def publics
		@public_lists = List.privacy.except_for_user(current_user).includes(:tasks, :user).paginate(:page => params[:page], :per_page => 5)
	end

	private

	  def list_params
	    params.require(:list).permit(:name, :privacy)
	  end

end
