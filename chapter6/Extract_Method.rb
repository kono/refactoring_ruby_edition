
class Extract_Method_Order
  attr_reader :amount
  def initialize(amount)
    @amount = amount
  end
end

class Extract_Method
  def initialize(name)
    @name=name
    @orders=Array.new
  end
  
  def order_entry(amount)
    @orders << Extract_Method_Order.new(amount)
  end
  
  def print_owing
    outstanding = 0.0
  
    #バナーを出力(print banner)
    puts "*************************"
    puts "***** Customer Owes *****"
    puts "*************************"
  
    #勘定を計算(calculate outstanding)
    @orders.each do |order|
      outstanding += order.amount
    end
  
    #詳細を表示(print details)
    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end

end

