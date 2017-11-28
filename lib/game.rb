class Game

  attr_reader :bank, :factory, :brain
  attr_accessor :counter, :clock

  def initialize
    @bank = Bank.new
    @factory = Factory.new

    @counter = 0
    @clock = 0
  end
  
end
