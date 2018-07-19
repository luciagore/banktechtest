# frozen_string_literal: true

require './lib/statement.rb'

describe Statement do
  let(:account) { double :account }
  let(:printer) { double :printer }
  subject(:statement) { described_class.new(account, printer) }

  let(:transactions) do
    [
      { date: '16-07-2018', credit: sprintf('%.2f', 100), debit: nil, balance: sprintf('%.2f', 100) },
      { date: '16-07-2018', credit: nil, debit: sprintf('%.2f', 20), balance: sprintf('%.2f', 80) }
    ]
  end
  let(:transactionstoo) do
    "date || credit || debit || balance\n16-07-2018 ||  || 20.00 || 80.00\n16-07-2018 || 100.00 ||  || 100.00\n"
  end

  it 'creates a list of each transaction from the account' do
    statement.transaction_list(transactions)
    expect(statement.previous_transactions).to include(
      '16-07-2018 ||  || 20.00 || 80.00', '16-07-2018 || 100.00 ||  || 100.00'
    )
  end

  it 'makes the printer print the statement to the console' do
    allow(account).to receive(:transactions).and_return(transactions)
    expect(printer).to receive(:print_statement)
    statement.print_statement
  end
end
