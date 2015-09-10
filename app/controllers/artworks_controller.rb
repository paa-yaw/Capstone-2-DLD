class ArtworksController < ApplicationController
	before_action :find_artwork, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!, except: [:index, :show]
  
	def index
		@artworks=Artwork.all.order('created_at DESC')
	end

	def show
		@comments=Comment.where(artwork_id: @artwork)
		@like=Like.where(artwork_id: @artwork)
	end

	def new
		@artwork=current_user.artworks.build
	end

	def create
		@artwork=current_user.artworks.build(artwork_params)

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
		@artwork.destroy
		redirect_to root_path
	end

	def like
		@like=Like.new(artwork: @artwork)

		if @like.save
			redirect_to @artwork
		end		
	end

	
	private

	def find_artwork
		@artwork=Artwork.find(params[:id])
	end

	def artwork_params
		params.require(:artwork).permit(:caption, :description, :image)
	end
end
