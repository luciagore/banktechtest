# frozen_string_literal: true

require './lib/printer.rb'

describe Printer do
  subject(:printer) { described_class.new }

  let(:statement) do
    [["10-07-2018 ||  || 20.00 || 80.00\n10-07-2018 || 100.00 ||  || 100.00\n"]]
  end

  it 'prints the previous transactions stored in the Statement with a title row' do
    expect { printer.print_statement(statement) }.to output(
      "date || credit || debit || balance\n10-07-2018 ||  || 20.00 || 80.00\n10-07-2018 || 100.00 ||  || 100.00\n"
    ).to_stdout
  end
end
