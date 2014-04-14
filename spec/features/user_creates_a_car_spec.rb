require 'spec_helper'

feature 'user creates a car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

# Acceptance Criteria:
#
#   I must specify the color, year, and mileage of the car.
#   Only years from 1980 and above can be specified.
#   I can optionally specify a description of the car.
#   If I enter all of the required information in the required formats, the car is recorded.
#   If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
#   Upon successfully creating a car, I am redirected so that I can create another car.

  before :each do
    car = FactoryGirl.create(:car)
  end

  it 'submits a valid car' do
    visit '/cars/new'
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content 'Add a New Car'
  end

  it 'submits an invalid car' do
    visit '/cars/new'
    click_on 'Submit'

    expect(page).to have_content "colorcan't be blank"
    expect(page).to have_content "yearcan't be blank"
    expect(page).to have_content "There was an error. Please redo the form."
  end
end
