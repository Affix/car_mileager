require 'mileage_calculator.rb'

class MileagesController < ApplicationController

  def index
  end

  def list
    @mileages = Mileage.all.order('date desc').where(user_id: current_user.id)
  end

  def delete
    mileage = Mileage.where(user_id: current_user.id, id: params[:id])
    if mileage.exists? && Mileage.destroy(params[:id])
      redirect_to list_path, notice: 'Mileage was successfully deleted.'
    else
      redirect_to list_path, alert: 'Unable to delete as no mileage was specified.'
    end
  end

  def create
    mileage = Mileage.create(date: params[:mileage][:date], amount: params[:mileage][:amount], user_id: current_user.id)
    if mileage.valid?
      redirect_to root_path, notice: 'Mileage was successfully created.'
    else
      redirect_to root_path, alert: 'Mileage was not successfully created, a valid date and an amount is required.'
    end
  end

  def monthly
    @actual = MileageCalculator.actual(current_user.id,@STARTING_MONTH)
    @expected = MileageCalculator.expected(@YEARLY_MILEAGE, @STARTING_MILEAGE)
    @labels = MileageCalculator.labels(@STARTING_MONTH)
    @current_months_position = @labels.index Time.now.strftime('%B').to_s
  end

  def populate_graph
    render json: [labels: MileageCalculator.labels(@STARTING_MONTH),
                  expected: MileageCalculator.expected(@YEARLY_MILEAGE, @STARTING_MILEAGE),
                  actual: MileageCalculator.actual(current_user.id,@STARTING_MONTH)]
  end

  private

  def mileage_params
    params.require(:mileage).permit(:date, :amount)
  end

end
