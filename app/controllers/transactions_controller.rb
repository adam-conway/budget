class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end
  #
  # def new
  #   @company = Company.new
  # end
  #
  # def create
  #   @company = Company.new(company_params)
  #   if @company.save
  #     flash[:success] = "#{@company.name} added!"
  #     redirect_to company_path(@company)
  #   else
  #     flash[:error] = "#{@company.name} already exists."
  #     render :new
  #   end
  # end
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
  #
  #
  # private
  #
  # def company_params
  #   params.require(:company).permit(:name, :city)
  # end
end
