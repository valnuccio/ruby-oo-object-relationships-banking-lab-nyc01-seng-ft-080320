require 'pry'

class Transfer

  attr_accessor :sender, :amount, :receiver, :status

  @@all=[]

  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount = amount
    @status = 'pending'
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? && receiver.valid? 
    ### we peeked on this one. why dont we have to go into BankAccount to access the #valid? in BankAccount
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && self.status == "pending" 
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if self.status=="complete" && self.valid? && receiver.balance > self.amount
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end