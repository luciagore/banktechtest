require 'date'

class Statement

  attr_accessor :account

  def initialize(account = Account.new)
    @account = account
  end

  def table_title
    puts "date || credit || debit || balance"
  end

end
