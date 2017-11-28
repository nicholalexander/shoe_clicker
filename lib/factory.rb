class Factory

  attr_reader :things
  
  def initialize
    @things = []
  end
  
  def run
    sum = 0

    @things.each do |thing|
      sum += thing.run
    end

    return sum
  end

  def build(thing)
    @things << thing
  end

end
