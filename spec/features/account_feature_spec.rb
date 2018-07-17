# As a user
# So that I can see the transactions ordered on a page
# I can print a statement of my transactions.

describe "Printing a statement of transactions" do

  subject(:account) { Account.new }
  subject(:statement) { Statement.new }
  subject(:printer) { Printer.new }

  it "shows a list of transactions, with their dates and rolling balance" do
    account.deposit(150)
    account.withdraw(55)
    statement.transaction_list(account.transactions)
    expect { printer.print_statement(statement.previous_transactions) }.to output("date || credit || debit || balance\n17-07-2018 ||  || 55 || 95\n17-07-2018 || 150 ||  || 150\n").to_stdout
  end
end
