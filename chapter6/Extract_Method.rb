
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
    print_banner
    outstanding = calculate_outstanding
    print_details outstanding
  end

  def print_banner
    #バナーを出力(print banner)
    puts "*************************"
    puts "***** Customer Owes *****"
    puts "*************************"
  end

  def print_details(outstanding)
    #詳細を表示(print details)
    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end

  def calculate_outstanding
    @orders.inject(0.0){|result, order| result + order.amount }
  end
end
