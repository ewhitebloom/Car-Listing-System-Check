class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path
    else
      flash.now[:notice] = 'There was an error. Please redo the form.'
      render 'new'
    end
  end

  private
  def car_params
    params.require(:car).permit(:color, :year, :description)
  end
end
