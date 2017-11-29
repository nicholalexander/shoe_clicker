class Thing
  
  attr_accessor :production, :cost

  def initialize
    @runnable = nil
    @production = nil
    @cost = nil

    raise "Must implement custom initialize with runnable, production, and cost."
  end

  # the action taken when the ui clicks on this thing.
  def click
    raise "Must implement custom click method."
  end

  def runnable?
    @runnable
  end

  # return the production - how many wavelengths does this thing make?
  def run
    @production
  end

end

