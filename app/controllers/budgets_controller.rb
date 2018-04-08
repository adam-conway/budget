class BudgetsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @budgets = @user.budgets
  end

  def show
    @user = User.find(params[:user_id])
    @budget = Budget.find(params[:id])
    @adjustment = Adjustment.new
  end

  def new
    @user = User.find(params[:user_id])
    @budget = @user.budgets.new
  end

  def create
    user = User.find(params[:user_id])
    @budget = user.budgets.new(budget_params)
    if @budget.save
      flash[:success] = "#{@budget.name} added!"
      redirect_to user_budgets_path(user)
    else
      flash[:error] = "Budget wasn't created successfully"
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @budget = Budget.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    @budget = Budget.find(params[:id])
    @budget.update(budget_params)
    if @budget.save
      flash[:success] = 'Budget updated!'
      redirect_to user_budgets_path(user)
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
