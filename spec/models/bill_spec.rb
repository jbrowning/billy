require 'spec_helper'

describe Bill do
  let(:bill) { create :bill }
  
  it 'is valid with the default factory' do
    bill.should be_valid
  end 

  it 'validates the presence of name' do
    bill.name = nil
    bill.should_not be_valid
  end

  it 'validates that name is not an empty string' do
    bill.name = ""
    bill.should_not be_valid
  end

  it 'validates the presence of amount_cents' do
    bill.amount_cents = nil
    bill.should_not be_valid
  end
end
