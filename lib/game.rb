class Game

  attr_reader :bank, :factory
  attr_accessor :counter

  def initialize
    @bank = Bank.new
    @factory = Factory.new(@bank)
    @counter = 0
  end
  
end
