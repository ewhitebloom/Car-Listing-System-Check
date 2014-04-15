require 'spec_helper'

describe Car do

  it { should validate_presence_of :color }
  it { should validate_presence_of :year }
  it { should validate_presence_of :mileage }

  it { should belong_to  :manufacturer }

  it { should validate_numericality_of(:year).is_greater_than(1980) }

  it { should belong_to :manufacturer }
end
