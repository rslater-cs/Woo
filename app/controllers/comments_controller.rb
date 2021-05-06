class CommentsController < ApplicationController
  before_action :set_tutor_client_relationship
  before_action :authenticate_user!


  def create
  	@comment = @tutor_client_relationship.comments.new(comment_params)
  	@comment.user = current_user
  	@comment.save

  	redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
  	params.require(:comment).permit(:body, :post_id)
  end

  def set_tutor_client_relationship
  	@tutor_client_relationship = TutorClientRelationship.find(params[:tutor_client_relationship_id])
  end
end
