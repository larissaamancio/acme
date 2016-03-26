# encoding: utf-8

class BookmarksController < ApplicationController

	before_action :authenticate_user!

	def index
		@list_bookmarks = Bookmark.where(:user_id => current_user)
	end
end