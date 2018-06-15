require_relative 'bike'

class DockingStation
attr_reader :capacity, :bikes
DEFAULT_CAPACITY = 20
def initialize(capacity=DEFAULT_CAPACITY)
  @bikes = []
  @capacity = capacity
end

def dock(bike)
  fail 'Docking station full' if full?
  @bikes << bike
end

def release_bike
  raise 'No bikes available' if check_working?.empty?
  @bikes.pop
end

#private
attr_reader :bikes



def full?
   @bikes.count >= @capacity
end

def empty?
  @bikes.empty?
end

def check_working?
  @bikes.select { |bike| !bike.broken? }
end
end
