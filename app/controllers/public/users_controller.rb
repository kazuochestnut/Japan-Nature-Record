class Public::UsersController < ApplicationController

  def show
    @user = current_user
    # @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
  end

  def check
  end

  def withdraw
  end


  private

	def user_params
  	params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :phone_numbar, :email, :address)
  end

end
