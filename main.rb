require 'lib/bank'
require 'lib/factory'
require 'lib/thing'
require 'lib/thing/infermoter'
require 'lib/brain'
require 'lib/game'

Shoes.app do

  #setup game.
  @game = Game.new

  @button_stack = stack do
    @clicker_button = button "clicker" do
      @game.bank.credit(1)
    end

    @inferometer_builder = button "inferometer" do
      inferometer = Inferometer.new
      @game.factory.build(inferometer)
      @game.bank.withdraw(inferometer.cost)
    end

  end

  @info_stack = stack do
    @balance = para "The balance is #{@game.bank.balance}"
    @game_counter = para "The game counter is #{@game.counter}"
    @factory = para "There are #{@game.factory.things.count} things."
  end

  @anim = animate 60 do

    # update
    @game.counter += 1
    @game.bank.credit(@game.factory.run)

    @game.bank.credit(1) if @game.counter % 40 == 0

    # render
    @balance.text = "The balance is #{@game.bank.balance}"
    @game_counter.text = "The game counter is #{@game.counter}"
    @factory.text = "There are #{@game.factory.things.count} things."
  end


end