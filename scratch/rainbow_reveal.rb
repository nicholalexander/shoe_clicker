# build a color every 1000 cycles
    if @game.counter % 1000 == 0
      @color_stack.contents.each do |color|
        unless color.visible?
          color.show
          break
        end
      end
    end