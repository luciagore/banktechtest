# As a user
# So that I can see the transactions ordered on a page
# I can print a statement of my transactions.

describe "Printing a statement of transactions" do

  subject(:account) { Account.new }
  subject(:statement) { Statement.new }
  subject(:printer) { Printer.new }
  subject(:today) { Today.new }

  let(:transactions) do
    [
      { date: '10-07-2018', credit: sprintf('%.2f', 150), debit: nil, balance: sprintf('%.2f', 150) },
      { date: '10-07-2018', credit: nil, debit: sprintf('%.2f', 55), balance: sprintf('%.2f', 95) }
    ]
  end

  it "shows a list of transactions, with their dates and rolling balance" do
    allow_any_instance_of(Today).to receive(:date_today).and_return("10-07-2018")
    allow_any_instance_of(Account).to receive(:transactions).and_return(transactions)
    account.deposit(150)
    account.withdraw(55)
    expect { statement.print_statement }.to output("date || credit || debit || balance\n10-07-2018 ||  || 55.00 || 95.00\n10-07-2018 || 150.00 ||  || 150.00\n").to_stdout
  end
end
