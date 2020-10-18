class Users::PostsController < Users::Base
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to users_post_path(@post.id), notice: '登録完了しました'
      else
        render "new"
      end
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:image, :name, :phone_number, :postal_number, :address, :introduce, :genre, :mood, :use, :type,:participant, :private,  :smoking)
  end
end
