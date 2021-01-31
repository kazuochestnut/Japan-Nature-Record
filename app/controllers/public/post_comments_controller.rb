class Public::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    # redirect_to book_path(@book)
    # render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    # redirect_to book_path(params[:book_id])
    # render :index
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
