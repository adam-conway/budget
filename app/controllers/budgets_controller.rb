class BudgetsController < ApplicationController

  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      flash[:success] = "#{@budget.name} added!"
      redirect_to budgets_path
    else
      flash[:error] = "Budget wasn't created successfully"
      render :new
    end
  end
  #
  # def create
  #   @category = Category.new(category_params)
  #   if @category.save
  #     flash[:success] = "Category added!"
  #     redirect_to categories_path
  #   else
  #     flash[:error] = "Category wasn't created successfully"
  #     render :new
  #   end
  # end
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


  private

  def budget_params
    params.require(:budget).permit(:name)
  end
end
