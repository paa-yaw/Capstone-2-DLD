class CommentsController < ApplicationController
  before_action :authenticate_user!
	def create
		@artwork=Artwork.find(params[:artwork_id])
		@comment=Comment.create(comment_params)
		@comment.artwork_id=@artwork.id 

		if @comment.save
			redirect_to artwork_path(@artwork)
		else
			render 'new'
		end
	end

	


	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
