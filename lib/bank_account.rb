require 'pry'


class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all=[]

    def initialize(name)
        @name=name
        @balance=1000
        @status="open"
        @@all << self
    end

    def deposit(deposit_amount)
        balance += deposit_amount
    end

    def self.all
        @@all
    end

    def trasfer(amount, receiver_account)
        Transfer.new(self, amount, receiver)
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        status=="open" && balance > 0
    end

    def close_account
        if self.status = 'open'
        self.status = 'closed'
        end

    end


end
