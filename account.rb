class Account
  attr_accessor :show_balance

  def initialize(name, balance=0)
    @name = name
    @balance = balance
  end

  def show_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance < amount
      "Can't complete transaction. Not enough funds"
    else
      new_balance = @balance -= amount
      account_statement(new_balance, amount)
    end
  end

  def account_statement(new_balance, amount)
    # show date
    time = Time.new
    values = time.to_a
    utc_time = Time.utc(*values)
    # show balance and amount withdrawn or deposited
    "New balance: #{new_balance}, Amount withdrawn: #{amount}, Time: #{utc_time}"
  end
end
