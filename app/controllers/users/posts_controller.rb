class Users::PostsController < Users::Base
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to users_post_path(@post.id), notice: '登録完了しました'
      else
        render "new"
      end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
       render "edit"
    else
      redirect_to users_posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to users_post_path, notice: '投稿を修正しました'
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_users_posts_path, notice: '投稿を削除しました'
  end

  private
  def post_params
    params.require(:post).permit(:image, :name, :phone_number, :postal_number, :address, :introduce, :genre, :mood, :use, :seat,:participant, :private,  :smoking)
  end
end
