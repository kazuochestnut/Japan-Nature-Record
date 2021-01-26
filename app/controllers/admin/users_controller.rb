class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address , :phone_number, :email, :is_deleted)
  end
end
