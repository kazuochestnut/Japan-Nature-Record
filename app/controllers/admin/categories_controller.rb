class Admin::CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
     redirect_to admin_categories_path(@category.id), success: "カテゴリーを追加しました"
    else
     flash.now[:danger] = "カテゴリーの追加に失敗しました"
     @categories = Category.all
     render :index
    end
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "カテゴリー名を変更しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリーの変更に失敗しました"
      render :index
    end
  end


  private
   def category_params
     params.require(:category).permit(:name)
   end
end
