class Factory

  attr_reader :things
  
  def initialize(bank)
    @things = []
    @bank = bank
  end
  
  def run
    sum = 0

    @things.each do |thing|
      sum += thing.run
    end

    return sum
  end

end
