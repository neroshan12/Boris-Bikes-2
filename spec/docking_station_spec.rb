require 'docking_station'

describe DockingStation do
  subject(:docking_station) {described_class.new}

  it {is_expected.to respond_to :release_bike}

  it 'docks something' do
    bike = Bike.new
    expect(docking_station.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.bike).to be_instance_of(Bike)
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq (bike)
    end

    it 'raises an error when there are no bikes available' do
      expect { docking_station.release_bike}.to raise_error "No bikes available"
    end

    it 'has a default capacity' do
      expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    describe 'initialization' do
      subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
      end
    end

    describe '#dock'
     it 'raises an error when full' do
       DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(Bike.new)} # 20 Bikes
       expect { docking_station.dock Bike.new}.to raise_error 'Docking station full'
     end
  end
