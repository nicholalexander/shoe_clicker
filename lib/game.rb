class Game

  attr_reader :bank, :factory, :brain
  attr_accessor :counter

  def initialize
    @bank = Bank.new
    @factory = Factory.new

    @counter = 0
  end
  
end
