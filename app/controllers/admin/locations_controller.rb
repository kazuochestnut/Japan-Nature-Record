class Admin::LocationsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def create
    @location = Location.new(location_params)
    if @location.save
     redirect_to admin_locations_path(@location.id), success: "撮影地を追加しました"
    else
     flash.now[:danger] = "撮影地の追加に失敗しました"
     @locations = Location.all
     render :index
    end
  end

  def index
    @locations = Location.all
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      flash[:success] = "撮影地を変更しました"
      redirect_to admin_locations_path
    else
      flash.now[:danger] = "撮影地の変更に失敗しました"
      render :index
    end
  end
  
  private
   def location_params
     params.require(:location).permit(:name)
   end
   
end
