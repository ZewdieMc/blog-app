class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def create
    @post = current_user.post.new(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
