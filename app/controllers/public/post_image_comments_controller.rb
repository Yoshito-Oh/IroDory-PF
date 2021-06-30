class Public::PostImageCommentsController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    @post_image_comment = PostImageComment.new(post_image_comment_params)
    @post_image_comment.user_id = current_user.id
    @post_image_comment.post_image_id = @post_image.id
    unless @post_image_comment.save
      render 'error'
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    post_image_comment = @post_image.post_image_comments.find(params[:id])
    post_image_comment.destroy
  end
  
  private
  
  def post_image_comment_params
    params.require(:post_image_comment).permit(:comment)
  end
  
end
