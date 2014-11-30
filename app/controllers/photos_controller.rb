class PhotosController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photo_params.merge (:user => @place.user)) I want to make this also the @place.user. 
		redirect_to place_path(@place)
	end 

	private

	def photo_params
		params.require(:photo).permit(:photos, :caption)
	end
end
