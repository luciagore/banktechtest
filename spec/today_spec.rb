require './lib/today.rb'

describe Today do

  subject(:today) { described_class.new }

  it 'initializes and checks the date is todays date' do
    allow_any_instance_of(Time).to receive(:strftime).and_return("10-07-2018")
    expect(today.date_today).to eq("10-07-2018")
  end
end
