require 'docking_station'
require 'bike'
describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new
  described_class.send(:public, *described_class.private_instance_methods)
  it { is_expected.to respond_to(:bikes) }
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do

    it 'releases working bikes' do
      bike = docking_station.release_bike
      expect(bike).to be_working
    end
    it 'releases a bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end
    it 'raises an error when no bikes are available' do
      expect{ docking_station.release_bike }.to raise_error ('No bikes available')
        end
    end
  describe '#dock' do

    it 'raises and error when full' do
      subject.capacity.times do
        subject.dock Bike.new
      end
    expect { subject.dock Bike.new }.to raise_error 'Docking station full'
  end
  describe 'initialize' do

    it 'gives a default capacity if not passed an argument' do
      expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'changes the capacity if passed an argument' do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq 50

    end

  end
end
end



  #it 'docks something' do
  #  bike = Bike.new
  #  expect(docking_station.dock(bike)).to eq bike
  #end
  #it 'returns docked bikes' do
  #  bike = Bike.new
  #  docking_station.dock(bike)
  #  expect(docking_station.bike).to eq bike
  #end
