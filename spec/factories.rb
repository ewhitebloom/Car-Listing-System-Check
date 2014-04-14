FactoryGirl.define do
  factory :car do
    color 'orange'
    year 1982
    description 'A vintage Cadillac worth $4 billion.'

    manufacturer
  end

  factory :manufacturer do
    name 'Cadillac'
    country 'USA'
  end
end
