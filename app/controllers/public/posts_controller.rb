class Public::PostsController < ApplicationController

 before_action :authenticate_user!
 before_action :ensure_correct_user ,only: [:edit, :update]

  def index
    @posts = Post.all
    @post = Post.new

  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
    # byebug
  end

  def new
    @post = Post.new
  end

  def create
    @post =Post.new(post_params)
    @post.user_id =current_user.id
    if @post.save
       flash[:success] = "投稿しました"
       redirect_to post_path(@post.id)
    else
       flash.now[:danger] = "投稿に失敗しました"
       render :new
    end
  end

  def location
    @posts = Post.all
  end

  def search
     @q = Post.ransack(params[:q])
     @posts = @q.result(distinct: true)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to post_path(@post.id)
    else
       render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:complete]="投稿を削除しました"
    redirect_to posts_path
  end

   private

  def ensure_correct_user
    @post = Post.find_by(id:params[:id])
    if @post.user_id != current_user.id
      redirect_to("/posts")
    end
  end

  def post_params
    params.require(:post).permit(:name, :image, :description, :shooting_date, :location_id, :category_id, :visit, :address)
  end

end
