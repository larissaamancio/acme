class ListsController < ActionController::Base
	before_action :authenticate_user!
	# before_filter :create

	def new
		@list = List.new
	end

	def create
		@list = List.create(list_params)
		@list.user_id = current_user.id
		@list.save

		respond_to do |format|
			format.js
		end

	end


	def index
		@lists = List.all
	end

	private

	  def list_params
	    #params.require(:list).permit(:name, :privacy)
	    params.permit(:name, :privacy)

	  end

end
