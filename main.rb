require 'lib/rainbow/bank'
require 'lib/rainbow/factory'
require 'lib/rainbow/thing'
require 'lib/rainbow/thing/infermoter'
require 'lib/rainbow/thing/prisim'
require 'lib/rainbow/brain'
require 'lib/rainbow/game'

require 'lib/ui/factory_renderer'

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
    stroke red
    @red = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height

    fill orange
    stroke orange
    @orange = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height

    fill yellow
    stroke yellow
    @yellow = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height    
    
    fill green
    stroke green
    @green = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    
    fill blue
    stroke blue
    @blue = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    
    fill purple
    stroke purple
    @purple = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    
    fill violet
    stroke violet
    @violet = rect left: 10, top: top, width: rainbow_width, height: rainbow_height
    top += rainbow_height
    nofill
    nostroke
  end

  @color_stack.contents.each do |rect|
    rect.hide
  end

  @info_stack = stack top: (top + 10) do
    @game_counter = para "The game counter is #{@game.counter}"
    @game_clock = para "The game clock is #{@game.clock}"
    
    @balance = para "You currently have #{@game.bank.balance} femtometers"
    @total = para "The total femtometers created is #{@game.bank.total_manufactured}"
    @factory = para "There are #{@game.factory.things.count} things in your factory."
  end

  @button_flow = flow top: (top * 2) do
    @clicker_button = button "femtometer generator" do
      @game.bank.credit(1)
    end

    @inferometer_builder = button "inferometer" do
      inferometer = Inferometer.new
      @game.factory.build(inferometer)
      @game.bank.withdraw(inferometer.cost)
    end

    @prisim_builder = button "prisim" do
      prisim = Prisim.new
      @game.factory.build(prisim)
      @game.bank.withdraw(prisim.cost)
    end
    
    @inferometer_builder.style(state: "disabled")
    @prisim_builder.style(state: "disabled")

    @inferometer_builder.hide
    @prisim_builder.hide
  end

  # enter game loop
  @anim = animate FRAME_RATE do

    # update
    @game.counter += 1
    
    if @game.counter % FRAME_RATE == 0
      @game.clock += 1
      @game.bank.credit(@game.factory.run)
    end

    # @game.bank.credit(@game.factory.run/FRAME_RATE)

    # render
    @balance.text = "You currently have #{@game.bank.balance} femtometers in your light-well"
    @total.text = "The total femtometers created is #{@game.bank.total_manufactured}"
    @game_counter.text = "The game counter is #{@game.counter}"
    @game_clock.text = "The game clock is #{@game.clock}"
    @factory.text = "There are #{@game.factory.things.count} things in your factory."

    if @game.bank.balance > 50 || @game.counter > 100
      @inferometer_builder.show unless @inferometer_builder.visible? 
    end

    if @game.bank.balance > 50
      @inferometer_builder.style(state: "enabled")
    end

    # build a color every 1000 cycles
    if @game.counter % 1000 == 0
      @color_stack.contents.each do |color|
        unless color.visible?
          color.show
          break
        end
      end
    end

  end


end