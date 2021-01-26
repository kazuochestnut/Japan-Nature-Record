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
  end

  def update
  end
  
   private
  def post_params
    params.require(:post).permit(:name, :image, :description, :shooting_date, :location_id, :category_id)
  end
  
end
