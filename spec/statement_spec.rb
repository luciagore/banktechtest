# frozen_string_literal: true

require './lib/statement.rb'

describe Statement do
  subject(:statement) { described_class.new }

  let(:transactions) do
    [
      { date: '16-07-2018', credit: sprintf('%.2f', 100), debit: nil, balance: sprintf('%.2f', 100) },
      { date: '16-07-2018', credit: nil, debit: sprintf('%.2f', 20), balance: sprintf('%.2f', 80) }
    ]
  end

  it 'creates a list of each transaction from the account' do
    statement.transaction_list(transactions)
    expect(statement.previous_transactions).to include(
      '16-07-2018 ||  || 20.00 || 80.00', '16-07-2018 || 100.00 ||  || 100.00'
    )
  end

  it 'prints the statement to the console' do
    account = double("Account")
    allow(account).to receive(:transactions).and_return(transactions)
    statement.transaction_list(account.transactions)
    expect { statement.print_statement }.to output(
      "date || credit || debit || balance\n16-07-2018 ||  || 20.00 || 80.00\n16-07-2018 || 100.00 ||  || 100.00\n"
    ).to_stdout
  end
end
