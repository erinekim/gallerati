class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@place = Place.find(params[:place_id])
		# temp_dictionary = {:user => current_user}
		# look_up_user = temp_dictionary[:user]
		@place.comments.create(comment_params.merge(:user => current_user))
		redirect_to place_path(@place)
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end
