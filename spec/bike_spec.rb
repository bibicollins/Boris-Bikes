require 'bike'

describe Bike do
  bike = Bike.new
  it { is_expected.to respond_to :working?}
  it { is_expected.to respond_to :report_broken}
  it { expect(bike.report_broken).to eq true }
end
