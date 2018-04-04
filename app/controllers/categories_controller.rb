class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @user = User.find(params[:user_id])
    @budget = Budget.find(params[:budget_id])
    @category = Category.new
  end

  def create
    user = User.find(params[:user_id])
    budget = Budget.find(params[:budget_id])
    @category = budget.categories.new(category_params)
    if @category.save
      flash[:success] = "Category added!"
      redirect_to user_budget_path(user, budget)
    else
      flash[:error] = "Category wasn't created successfully"
      render :new
    end
  end
  #
  # def edit
  #   @transaction = Transaction.find(params[:id])
  # end
  #
  # def update
  #   @transaction = Transaction.find(params[:id])
  #   @transaction.update(transaction_params)
  #   if @transaction.save
  #     flash[:success] = 'Transaction updated!'
  #     redirect_to transactions_path
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   transaction = Transaction.find(params[:id])
  #   transaction.destroy
  #
  #   flash[:success] = "Transaction from #{transaction.date} successfully deleted!"
  #   redirect_to transactions_path
  # end
  #
  #
  private

  def category_params
    params.require(:category).permit(:title, :current_balance)
  end
end
