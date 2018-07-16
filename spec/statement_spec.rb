require './lib/statement.rb'

describe Statement do
	subject(:statement) { described_class.new }

  it "prints a title row for the statement" do
    expect{ statement.table_title }.to output("date || credit || debit || balance\n").to_stdout
  end

end
