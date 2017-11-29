class Bank

  attr_reader :balance, :total_manufactured
  
  def initialize
    @balance = 0
    @total_manufactured = 0
  end

  def credit(ammount)
    @balance += ammount
    @total_manufactured += ammount
  end

  def withdraw(ammount)
    @balance -= ammount
  end

end