require 'pry'

Shoes.app do
  counter = 0
  @para = para "this is some info: "
  @anim = animate 40 do
    @para.text = "this is some info: #{counter+=1}"
  end
end
