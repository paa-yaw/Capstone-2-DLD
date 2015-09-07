class ArtworksController < ApplicationController
	before_action :find_artwork, only: [:show, :edit, :update, :destroy]
	def index
		@artworks=Artwork.all.order('created_at DESC')
	end

	def show
	end

	def new
		@artwork=Artwork.new
	end

	def create
		@artwork=Artwork.new(artwork_params)

		if @artwork.save
			redirect_to @artwork
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @artwork.update(artwork_params)
			redirect_to @artwork
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def find_artwork
		@artwork=Artwork.find(params[:id])
	end

	def artwork_params
		params.require(:artwork).permit(:caption, :description, :image)
	end
end
