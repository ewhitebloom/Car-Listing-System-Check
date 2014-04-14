FactoryGirl.define do
  factory :car do
    color 'orange'
    year 1982
    mileage 409348
    description 'A vintage Cadillac worth $4 billion.'

    manufacturer
  end

  factory :manufacturer do
    name 'Cadillac'
    country 'United States of America'
  end
end
