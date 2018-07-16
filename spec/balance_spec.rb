require './lib/account.rb'

describe Account do
	subject(:account) { described_class.new }

	context "#balance" do
		it "initalizes and checks that balance is zero" do
	  		expect(account.balance).to eq Account::START_BALANCE
		end

    it "allows user to deposit money and so increase balance" do
      expect { account.deposit(100) }.to change { account.balance }.by 100
    end

    it "allows user to withdraw money and so decrease balance" do
      expect { account.withdraw(100) }.to change { account.balance }.by -100
    end
	end
end
