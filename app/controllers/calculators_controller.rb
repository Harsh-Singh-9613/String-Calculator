class CalculatorsController < ApplicationController
  def index; end

  def calculate
    @result = Calculator::StringCalculator.add(params[:input])
    render :index
  rescue => e
    @error = e.message
    render :index
  end
end
