class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @transaction = Transaction.new
  end
  #
  # def new
  #   @company = Company.new
  # end
  #
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
  #
  # def show
  #   @company = Company.find(params[:id])
  #   @contact = Contact.new
  #   @contacts = @company.contacts
  # end
  #
  # def edit
  #   @company = Company.find(params[:id])
  # end
  #
  # def update
  #   @company = Company.find(params[:id])
  #   @company.update(company_params)
  #   if @company.save
  #     flash[:success] = "#{@company.name} updated!"
  #     redirect_to company_path(@company)
  #   else
  #     render :edit
  #   end
  # end
  #
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
