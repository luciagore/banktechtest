# frozen_string_literal: true
require_relative 'today'

class Account
  START_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(balance = START_BALANCE)
    @balance = balance
    @transactions = []
  end

  def deposit(money, date = Today.new)
    @balance += sprintf('%.2f', money).to_f
    @transactions << (
      { date: date.date_today, credit: sprintf('%.2f', money), debit: nil, balance: sprintf('%.2f', @balance) })
  end

  def withdraw(money, date = Today.new)
    message = 'Insufficient funds'
    raise message if money.abs > @balance
    @balance -= sprintf('%.2f', money).to_f
    @transactions << (
      { date: date.date_today, credit: nil, debit: sprintf('%.2f', money), balance: sprintf('%.2f', @balance) })
  end
end
