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

  describe '#pay!' do
    it 'updates date_paid to the current date' do
      bill.pay!
      
      bill.date_paid.should eql(Date.current)
    end
  end

  describe '#settle!' do
    it 'pays the bill if it has not already been paid' do
      bill.should_receive(:pay!)

      bill.settle!

      paid_bill = create :bill, date_paid: Date.current

      paid_bill.should_not_receive(:pay!)

      paid_bill.settle!
    end
    
    it 'marks the bill as settled' do
      expect {
        bill.settle!
      }.to change { bill.settled? }.to(true)
    end
  end
end
