# frozen_string_literal: true

class Account
  START_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(balance = START_BALANCE)
    @balance = balance
    @transactions = []
  end

  def deposit(money)
    @balance += money
    @transactions << (
      { date: Time.new.strftime('%d-%m-%Y'), credit: money, debit: nil, balance: @balance })
  end

  def withdraw(money)
    message = 'Insufficient funds'
    raise message if money.abs > @balance
    @balance -= money
    @transactions << (
      { date: Time.new.strftime('%d-%m-%Y'), credit: nil, debit: money, balance: @balance })
  end
end
