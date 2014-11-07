require 'mileage_calculator.rb'

class MileagesController < ApplicationController

  def index
  end

  def list
    @mileages = Mileage.all.order('date desc')
  end

  def delete
    Mileage.find(params[:id]).destroy

    redirect_to list_path, notice: "Mileage was successfully deleted."
  end

  def create
    Mileage.create(date: params[:mileage][:date], amount: params[:mileage][:amount])

    redirect_to root_path, notice: "Mileage was successfully created."
  end

  def monthly
    @actual = MileageCalculator.actual(@STARTING_MONTH)
    @expected = MileageCalculator.expected(@YEARLY_MILEAGE, @STARTING_MILEAGE)
    @labels = MileageCalculator.labels(@STARTING_MONTH)
    @current_months_position = @labels.index Time.now.strftime('%B').to_s
  end

  def populate_graph
    render json: [labels: MileageCalculator.labels(@STARTING_MONTH),
                  expected: MileageCalculator.expected(@YEARLY_MILEAGE, @STARTING_MILEAGE),
                  actual: MileageCalculator.actual(@STARTING_MONTH)]
  end

  private

  def mileage_params
    params.require(:mileage).permit(:date, :amount)
  end

end
