require 'pry'

# require files

# set up game classes

# start
Shoes.app do

  @counter = 0
  @clicks = 0

  # set up shoes windows

  @para = para "this is some info: "
  @clicker_para = para "this is how many clicks you have: "
  
  @clicker_button = button do
    @clicks +=1
  end

  # game loop
  @anim = animate 40 do
    @para.text = "this is some info: #{@counter+=1}"
    @clicker_para.text = "this is how many clicks you have: #{@clicks}"
  end
end


