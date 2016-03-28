# encoding: utf-8

class BookmarksController < ApplicationController

	before_action :authenticate_user!

	def index
		@list_bookmarks = Bookmark.where(:user_id => current_user)
	end

	def create
		@lb = Bookmark.new
		@lb.list_id = params[:list_id]
		@lb.user_id = current_user.id
		@lb.save

		redirect_to do |format|
			format.js
		end
	end

	private

	  # def bookmark_params
	  #   params.require(:bookmark).permit(:user_id, :list_id)
	  # end

end

