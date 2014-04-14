class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_path
    else
      flash.now[:notice] = 'There was an error. Please redo the form.'
      render 'new'
    end
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
