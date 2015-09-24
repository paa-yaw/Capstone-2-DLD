class CommentsController < ApplicationController
  before_action :authenticate_user!
	def create
		@artwork=Artwork.find(params[:artwork_id])
		@comment=current_user.comments.build(comment_params)
		@comment.artwork_id=@artwork.id 

		if @comment.save
			redirect_to artwork_path(@artwork)
		else
			render 'new'
		end
	end

  def destroy
    @artwork=Artwork.find(params[:artwork_id])
    @comment=@artwork.comments.find(params[:id])
    @comment.destroy
    redirect_to @artwork
  end
	


	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
