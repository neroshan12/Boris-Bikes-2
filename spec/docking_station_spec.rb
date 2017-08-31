require 'docking_station'

describe DockingStation do
  subject(:docking_station) {described_class.new}

  it {is_expected.to respond_to :release_bike}

  it 'releases working bikes' do
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    docking_station.dock(bike)
    expect(subject.bike).to eq bike
  end
end
