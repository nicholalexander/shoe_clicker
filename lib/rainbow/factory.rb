class Factory

  attr_reader :built_things, :available_things
  
  def initialize
    @built_things = []
    @available_things = []
  end
  
  def run
    sum = 0

    @built_things.each do |thing|
      sum += thing.run if thing.runnable?
    end

    return sum
  end

  def build(thing)
    @built_things << thing
  end

  def discover(thing)
    @available_things << thing
  end
end
