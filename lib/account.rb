class Account

  START_BALANCE = 0

  attr_reader :balance

  def initialize(balance = START_BALANCE)
    @balance = balance
  end

  def deposit(money)
    @balance += money
  end

  def withdraw(money)
    message = "Insufficient funds"
    raise message if money > @balance
    @balance -= money
  end

end
