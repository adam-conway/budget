class ChargesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @budget = Budget.find(params[:budget_id])
    @categories = @budget.categories
    @charges = @budget.charges.order_by_date
    @charge = Charge.new
  end

  def new
    @user = User.find(params[:user_id])
    @budget = Budget.find(params[:budget_id])
    @charge = Charge.new
    @charge_category_adjustment = ChargeCategoryAdjustment.new
    @categories = @budget.categories
  end

  def create
    @user = User.find(params[:user_id])
    budget = Budget.find(params[:budget_id])
    @charge = budget.charges.new(charge_params)
    if @charge.save
      if params[:charge_categories]
        build_charge_categories(params[:charge_categories], @charge)
      else
        adjustment = Adjustment.create!(amount: @charge.amount)
        ChargeCategoryAdjustment.create!(charge_id: @charge.id, category_id: params[:charge][:id], adjustment_id: adjustment.id)
      end
      flash[:success] = 'Charge added!'
      redirect_to user_budget_charges_path(@user, budget)
    else
      flash[:error] = "Charge wasn't created successfully"
      @budget = Budget.find(params[:budget_id])
      @categories = @budget.categories
      @charges = @budget.charges.order_by_date
      render :index
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @budget = Budget.find(params[:budget_id])
    @charge = Charge.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    budget = Budget.find(params[:budget_id])
    @charge = Charge.find(params[:id])
    @charge.update(charge_params)
    if @charge.save
      flash[:success] = 'Charge updated!'
      redirect_to user_budget_charges_path(user, budget)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:user_id])
    budget = Budget.find(params[:budget_id])
    charge = Charge.find(params[:id])
    charge.destroy

    flash[:success] = "Charge from #{charge.date} successfully deleted!"
    redirect_to user_budget_charges_path(user, budget)
  end

  private

  def build_charge_categories (params, charge)
    params.each_with_index do |category, index|
      next if category[:inflow] == "" && category[:outflow] == ""
      ChargeCategory.create(charge_id: charge.id,
        category_id: index + 1,
        inflow: category[:inflow].to_f,
        outflow: category[:outflow].to_f)
    end
  end

  def charge_params
    params.require(:charge).permit(:date, :payee, :notes, :amount)
  end
end
