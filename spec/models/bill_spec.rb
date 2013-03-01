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

  describe 'settled/unsettled' do
    let(:user) { create :user }
    let!(:settled_bill) { create :bill, :settled, user: user }
    let!(:unsettled_bill) { create :bill, :unsettled, user: user }
    
    describe '.settled' do
      it 'includes the settled records' do
        user.bills.settled.should =~ [settled_bill]
      end
    end

    describe '.unsettled' do
      it 'includes the unsettled records' do
        user.bills.unsettled.should =~ [unsettled_bill]
      end
    end
  end
end
