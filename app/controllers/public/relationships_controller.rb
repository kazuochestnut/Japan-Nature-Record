class Public::RelationshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user_path(params[:follow_id])
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user_path(params[:follow_id])
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user_path(params[:follow_id])
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_path(params[:follow_id])
    end
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end
end
