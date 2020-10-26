class Users::PostCommentsController < Users::Base
  before_action :authenticate_user!
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = Post.find(params[:post_id]).id
    if @post_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to users_posts_path
    end

  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_id)
  end
end
