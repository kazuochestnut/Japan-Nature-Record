class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def my_page
    @user = current_user
    @posts = @user.posts
    render "show"
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "成功"
      redirect_to users_my_page_path
    else
      flash.now[:danger] = "失敗"
      redirect_to my_page_edit
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
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end


  private

  def user_params
    params.require(:user).permit(:profile_image, :family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :phone_numbar, :email, :address )
  end

end
