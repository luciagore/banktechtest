require 'date'

class Statement

  attr_accessor :account

  def initialize(account = Account.new)
    @account = account
  end

end
