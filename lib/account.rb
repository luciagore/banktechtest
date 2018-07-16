class Account

  START_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(balance = START_BALANCE)
    @balance = balance
    @transactions = []
  end

  def deposit(money)
    @balance += money
    @transactions << ([money, Time.new.strftime("%d-%m-%Y")])
  end

  def withdraw(money)
    message = "Insufficient funds"
    raise message if money.abs > @balance
    @balance += money
    @transactions << money
  end

end
