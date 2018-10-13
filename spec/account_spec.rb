require 'spec_helper'
require './account'

RSpec.describe Account do

  before do
    @account = Account.new("Takuma")
  end

  describe "#show_balance" do
    it "returns balance of new account" do
      expect(@account.show_balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "adds money to the account" do
      @account.deposit(20)
      expect(@account.show_balance).to eq(20)
    end
  end

  describe "#withdraw" do
    it "subtracts/withdraws money from account" do
      @account.deposit(20)
      @account.withdraw(10)
      expect(@account.show_balance).to eq(10)
    end

    it "prevents overdraft" do
      @account.deposit(20)
      expect(@account.withdraw(30)).to eq("Can't complete transaction. Not enough funds")
    end
  end

  describe "#account_statement" do
    it "shows balance time and money withdrawn/deposited" do
      time = Time.new
      values = time.to_a
      utc_time = Time.utc(*values)
      printed_statement = "New balance: 10, Amount withdrawn: 30, Time: #{utc_time}"
      @account.deposit(40)
      expect(@account.withdraw(30)).to eq(printed_statement)
    end
  end
end
