class ChargesController < ApplicationController
  def index
    @charges = Charge.order_by_date
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)
    if @charge.save
      flash[:success] = "Charge added!"
      redirect_to charges_path
    else
      flash[:error] = "Charge wasn't created successfully"
      @charges = Charge.all
      render :index
    end
  end

  def edit
    @charge = Charge.find(params[:id])
  end

  def update
    @charge = Charge.find(params[:id])
    @charge.update(charge_params)
    if @charge.save
      flash[:success] = 'Charge updated!'
      redirect_to charges_path
    else
      render :edit
    end
  end

  def destroy
    charge = Charge.find(params[:id])
    charge.destroy

    flash[:success] = "Charge from #{charge.date} successfully deleted!"
    redirect_to charges_path
  end


  private

  def charge_params
    params.require(:charge).permit(:date, :payee, :notes, :inflow, :outflow)
  end
end
