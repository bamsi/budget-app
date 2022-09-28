class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:expenditures).where(user_id: current_user.id)
  end
end
