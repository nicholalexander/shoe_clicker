class Factory

  attr_reader :things
  
  def initialize
    @things = []
  end
  
  def run
    sum = 0
    effects = []

    @things.each do |thing|
      if thing.runnable?
        sum += thing.run 
      else
        effects << thing
      end
    end

    effects.each do |effect|
      sum = effect.apply.call sum
    end

    return sum
  end

  def build(thing)
    @things << thing
  end

end
