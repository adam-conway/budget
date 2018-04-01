class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:success] = "Transaction added!"
      redirect_to transactions_path
    else
      flash[:error] = "Transaction wasn't created successfully"
      @transactions = Transaction.all
      render :index
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    if @transaction.save
      flash[:success] = 'Transaction updated!'
      redirect_to transactions_path
    else
      render :edit
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy

    flash[:success] = "Transaction from #{transaction.date} successfully deleted!"
    redirect_to transactions_path
  end


  private

  def transaction_params
    params.require(:transaction).permit(:date, :payee, :notes, :inflow, :outflow)
  end
end
