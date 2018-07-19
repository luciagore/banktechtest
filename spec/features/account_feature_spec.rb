# As a user
# So that I can put money in my account
# I can make a deposit

# As a user
# So that I can use money from my account
# I can make a deposit
require './lib/account.rb'

describe "Using an account to withdraw and deposit funds" do

  subject(:account) { Account.new }

  it "shows an account can have funds added to the balance" do
    account.deposit(150)
    expect(account.balance).to be(150.00)
  end

  it "shows an account can have funds withdrawn from the balance" do
    account.deposit(20)
    account.withdraw(10)
    expect(account.balance).to be(10.00)
  end

  it "shows an account cannot be overdrawn" do
    account.deposit(20)
    expect{ account.withdraw(50) }.to raise_error("Insufficient funds")
  end
end
