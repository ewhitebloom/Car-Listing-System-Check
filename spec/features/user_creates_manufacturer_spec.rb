require 'spec_helper'

feature 'user creates a manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

# Acceptance Criteria:

# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  before :each do
    @manufacturer = FactoryGirl.create(:manufacturer)
  end

  it 'submits a valid manufacturer' do
    count = Manufacturer.count
    visit '/manufacturers/new'
    fill_in 'Name', with: @manufacturer.name
    select( @manufacturer.country, :from => 'Country')
    click_on 'Submit'

    expect(page).to have_content 'Add a New Manufacturer'
    expect(Manufacturer.count).to eql(count + 1)
  end

  it 'submits an invalid manufacturer' do
    count = Manufacturer.count
    visit '/manufacturers/new'
    click_on 'Submit'

    expect(page).to have_content "Namecan't be blank"
    expect(page).to have_content "can't be blank"
    expect(page).to have_content 'Please review the problems below'
    expect(Manufacturer.count).to eql(count)
  end
end
