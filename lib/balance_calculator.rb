class BalanceCalculator
  def initialize(user)
    @user = user
  end

  def account_balance
    symbol = @user.balance.symbol
    amount = @user.balance.to_s
    "#{symbol}#{amount}" 
  end

  def available_balance
    symbol = @user.balance.symbol
    balance = @user.balance
    available_balance = balance - unsettled_amount
    "#{symbol}#{available_balance}"
  end

private

  def unsettled_amount
    Money.new(@user.bills.unsettled.sum(&:amount_cents))
  end

end
