require './lib/statement.rb'

describe Statement do
	subject(:statement) { described_class.new }

  it "prints a title row for the statement" do
    expect{ statement.table_title }.to output("date || credit || debit || balance\n").to_stdout
  end

  it "prints each transaction from the account" do
    account = double("account", :transactions => [{date: "16-07-2018", credit: 100, debit: nil, balance: 100}, {date: "16-07-2018", credit: nil, debit: 20, balance: 80}])
    expect{ statement.transaction_list(account.transactions) }.to output(
      "16-07-2018 || 100 ||  || 100\n16-07-2018 ||  || 20 || 80\n").to_stdout
  end

end
