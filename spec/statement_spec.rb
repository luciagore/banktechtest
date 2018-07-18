# frozen_string_literal: true

require './lib/statement.rb'

describe Statement do
  subject(:statement) { described_class.new }

  let(:transactions) do
    [
      { date: '16-07-2018', credit: 100.00, debit: nil, balance: 100.00 },
      { date: '16-07-2018', credit: nil, debit: 20.00, balance: 80.00 }
    ]
  end

  it 'creates a list of each transaction from the account' do
    statement.transaction_list(transactions)
    expect(statement.previous_transactions).to include(
      '16-07-2018 ||  || 20.00 || 80.00', '16-07-2018 || 100.00 ||  || 100.00'
    )
  end
end
