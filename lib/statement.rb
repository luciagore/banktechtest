# frozen_string_literal: true

class Statement
  attr_reader :account, :previous_transactions

  def initialize(account = Account.new)
    @account = account
    @previous_transactions = []
  end

  def transaction_list(transactions = @account.transactions)
    transactions.reverse.each do |entry|
      @previous_transactions << \
        "#{entry[:date]} || #{entry[:credit]} || #{entry[:debit]} || #{entry[:balance]}"
    end
  end
end
