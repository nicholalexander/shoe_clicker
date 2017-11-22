class Game

  attr_reader :bank
  attr_accessor :counter

  def initialize
    @bank = Bank.new
    @counter = 0
  end
  
end
