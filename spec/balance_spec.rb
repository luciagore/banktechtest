require './lib/account.rb'

describe Account do
	subject(:account) { described_class.new }

	context "#balance" do
		it "initalizes and checks that balance is zero" do
	  		expect(account.balance).to eq Account::START_BALANCE
		end
	end
end
