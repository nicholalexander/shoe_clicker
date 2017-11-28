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

  rainbow_height = 20
  rainbow_width = 300
  top = 10

  # draw initial screen
  @color_stack = stack do
    fill red
    @red = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height

    fill orange
    @orange = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height

    fill yellow
    @yellow = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height    
    
    fill green
    @green = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    
    fill blue
    @blue = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    
    fill purple
    @purple = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    
    fill violet
    @violet = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    nofill
  end

  @color_stack.contents.each do |rect|
    rect.toggle
  end

  @info_stack = stack top: (top + 10) do
    @game_counter = para "The game counter is #{@game.counter}"
    @game_clock = para "The game clock is #{@game.clock}"
    
    @balance = para "The balance is #{@game.bank.balance}"
    @factory = para "There are #{@game.factory.things.count} things."
  end

  @button_stack = stack top: (top * 2) do
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

  # enter game loop
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

    if @game.counter > 1000
      @red.show
    end

  end


end