require 'lib/bank'
require 'lib/factory'
require 'lib/thing'
require 'lib/game'

Shoes.app do

  #setup game.
  @game = Game.new


  @button_stack = stack do
    @clicker_button = button "clicker" do
      @game.bank.credit(1)
    end

    @inferometer_builder do
      @game.factory.things << 
    end

  end

  @info_stack = stack do
    @balance = para "The balance is #{@game.bank.balance}"
    @game_counter = para "The game counter is #{@game.counter}"
  end

  @anim = animate 40 do
    # update
    @game.counter += 1
    @game.bank.credit(@game.factory.run)

    @game.bank.credit(1) if @game.counter % 40 == 0

    # render
    @balance.text = "The balance is #{@game.bank.balance}"
    @game_counter.text = "The game counter is #{@game.counter}"
  end


end