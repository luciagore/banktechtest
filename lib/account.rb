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
    @balance += money
    @transactions << (
      { date: date.date_today, credit: money, debit: nil, balance: @balance })
  end

  def withdraw(money, date = Today.new)
    message = 'Insufficient funds'
    raise message if money.abs > @balance
    @balance -= money
    @transactions << (
      { date: date.date_today, credit: nil, debit: money, balance: @balance })
  end
end
