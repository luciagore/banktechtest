require 'date'

class Statement

  attr_accessor :account

  def initialize(account = Account.new)
    @account = account
  end

  def table_title
    puts "date || credit || debit || balance"
  end

  def transaction_list(transactions = @account.transactions)
    transactions.each do |entry|
      puts "#{entry[:date]} || #{entry[:credit]} || #{entry[:debit]} || #{entry[:balance]}"
    end

  end

end
