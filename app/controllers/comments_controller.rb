class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :set_post, only: [:create,:destroy]
  def create
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def set_post
      @post = Post.find(params[:post_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body, :name)
    end  
end

