class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new

  end

  def show
    @post = Post.find(params[:id])
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
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to post_path(@post)
    else
       render :edit
    end
  end

   private
  def post_params
    params.require(:post).permit(:name, :image, :description, :shooting_date, :location_id, :category_id)
  end

end
