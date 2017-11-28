class Prisim < Thing

  def runnable?
    false
  end

  def apply
    Proc.new { |x| x * 2 }
  end

  def cost
    1000
  end
  
end
