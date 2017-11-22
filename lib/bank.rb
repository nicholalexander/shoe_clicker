class Bank

  def initialize
    @balance = 0
  end

  def credit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    @balance -= ammount
  end

  def balance
    @balance
  end

end