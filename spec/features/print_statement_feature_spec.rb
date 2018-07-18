# As a user
# So that I can see the transactions ordered on a page
# I can print a statement of my transactions.

describe "Printing a statement of transactions" do

  subject(:account) { Account.new }
  subject(:statement) { Statement.new }
  subject(:printer) { Printer.new }
  subject(:today) { Today.new }

  it "shows a list of transactions, with their dates and rolling balance" do
    allow_any_instance_of(Today).to receive(:date_today).and_return("10-07-2018")
    account.deposit(150)
    account.withdraw(55)
    statement.transaction_list(account.transactions)
    expect { printer.print_statement(statement.previous_transactions) }.to output("date || credit || debit || balance\n10-07-2018 ||  || 55 || 95\n10-07-2018 || 150 ||  || 150\n").to_stdout
  end
end
