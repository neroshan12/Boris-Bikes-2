require 'docking_station'

describe DockingStation do
  subject(:docking_station) {described_class.new}

  it {is_expected.to respond_to :release_bike}

  it 'docks something' do
    bike = Bike.new
    expect(docking_station.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.bike).to eq bike
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { docking_station.release_bike}.to raise_error "No bikes available"
    end

    describe '#dock'
     it 'raises an error when full' do
       subject.dock(Bike.new)
       expect { docking_station.dock Bike.new}.to raise_Error 'Docking station full'
     end
  end
end
