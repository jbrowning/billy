class BalanceCalculator
  def initialize(user)
    @user = user
  end

  def account_balance
    symbol = @user.balance.symbol
    amount = @user.balance.to_s
    "#{symbol}#{amount}" 
  end
end
