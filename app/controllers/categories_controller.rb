class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:expenditures).where(user_id: current_user.id)
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    redirect_to categories_path, notice: 'You have successfully added a category' if @category.save
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
