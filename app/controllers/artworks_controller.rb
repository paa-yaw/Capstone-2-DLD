class ArtworksController < ApplicationController
	before_action :find_artwork, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :purchase]
  before_action :authenticate_user!, except: [:index, :show]
  
	def index
    if params[:category].blank?
		@artworks=Artwork.all.order('created_at DESC')
    else
      @category_id= Category.find_by(name: params[:category]).id
      @artworks= Artwork.where(category: @category_id).order('created_at DESC')
    end
	end

	def show
		@comments=Comment.where(artwork_id: @artwork)
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

	def upvote
    @artwork.upvote_by current_user
    redirect_to :back
  end

  # def downvote
  #   @artwork.downvote_by current_user
  #   redirect_to :back
  # end

  def purchase
    if current_user
      render 'purchase'
    else
      redirect_to :back
    end
  end
	
	private

	def find_artwork
		@artwork=Artwork.find(params[:id])
	end

	def artwork_params
		params.require(:artwork).permit(:caption, :description, :image, :category_id)
	end
end
