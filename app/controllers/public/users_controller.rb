class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
     @user = current_user
     @posts = @user.posts
    # @user = User.find(params[:id])
  end

  def edit
    @user = current_user

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end

  def check
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:success] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


  private

  	def user_params
    	params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :phone_numbar, :email, :address)
    end

end
