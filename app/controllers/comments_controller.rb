class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = @post.comments.new
  end
  def create
    @comment = @post.comments.create! params.expect(comment: [:content])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
  end
  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
