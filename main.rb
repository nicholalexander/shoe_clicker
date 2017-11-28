require 'lib/bank'
require 'lib/factory'
require 'lib/thing'
require 'lib/thing/infermoter'
require 'lib/brain'
require 'lib/game'

FRAME_RATE = 60

Shoes.app do

  #setup game.
  @game = Game.new

  
  # background red, width: 100, right: 50
  # background orange, width: 100, right: 100

  # arc 
  
  @info_stack = stack do
    @game_counter = para "The game counter is #{@game.counter}"
    @game_clock = para "The game clock is #{@game.clock}"
    
    @balance = para "The balance is #{@game.bank.balance}"
    @factory = para "There are #{@game.factory.things.count} things."
  end

  @button_stack = stack do
    @clicker_button = button "clicker" do
      @game.bank.credit(1)
    end

    @inferometer_builder = button "inferometer" do
      inferometer = Inferometer.new
      @game.factory.build(inferometer)
      @game.bank.withdraw(inferometer.cost)
    end
    @inferometer_builder.style(state: "disabled")

  end

  @anim = animate FRAME_RATE do

    # update
    @game.counter += 1
    
    if @game.counter % FRAME_RATE == 0
      @game.clock += 1
      @game.bank.credit(@game.factory.run)
    end

    # render
    @balance.text = "The balance is #{@game.bank.balance}"
    @game_counter.text = "The game counter is #{@game.counter}"
    @game_clock.text = "The game clock is #{@game.clock}"
    @factory.text = "There are #{@game.factory.things.count} things."

    if @game.bank.balance > 50 || @game.counter > 1000
      @inferometer_builder.style(state: "enabled")
    end

  end


end