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

  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.update(budget_params)
    if @budget.save
      flash[:success] = 'Budget updated!'
      redirect_to budgets_path
    else
      render :edit
    end
  end
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
