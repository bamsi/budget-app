class ExpendituresController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @expenditure = Expenditure.new
    @category_id = params[:category_id]
  end

  def create
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.author = current_user
    @expenditure.category_id = params[:category_id]
    redirect_to category_expenditures_path(category_id: params[:category_id]), notice: 'You have successfully added transaction' if @expenditure.save
  end

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount)
  end
end
