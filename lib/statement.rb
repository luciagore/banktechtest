# frozen_string_literal: true
require_relative 'printer'

class Statement
  attr_reader :account, :previous_transactions, :printer

  def initialize(account = Account.new, printer = Printer.new)
    @account = account
    @printer = printer
    @previous_transactions = []
  end

  def transaction_list(transactions = @account.transactions)
    transactions.reverse.each do |entry|
      @previous_transactions << \
        "#{entry[:date]} || #{entry[:credit]} || #{entry[:debit]} || #{entry[:balance]}"
    end
  end

  def print_statement
    transaction_list
    @printer.print_statement(@previous_transactions)
  end
end
