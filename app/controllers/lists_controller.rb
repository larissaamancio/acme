# encoding: utf-8

class ListsController < ApplicationController
	before_action :authenticate_user!

	# respond_to :json, :js

	def new
		@list = List.new
	end

	def create
		@list = List.create(list_params)
		@list.user_id = current_user.id

   if @list.save
   	render :json => @list
   end

	end

	def index
		@lists = List.all
	end

	def bookmarmarks

	end

	def publics
		@lists = List.where(:privacy => true)
	end

	private

	  def list_params
	    params.require(:list).permit(:name, :privacy)
	    # params.permit(:name, :privacy)

	  end

end
