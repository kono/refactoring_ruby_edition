require 'Movie'
require 'Rental'

class Customer
  attr_reader :name
  attr_accessor :result
  
  def initialize(name)
    @name = name
    @rentals = []
  end
  
  def add_rental(arg)
    @rentals << arg
  end
  
  def statement
    frequent_renter_points =  0
    @result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # このレンタル料金を表示
      @result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # フッター行を追加
    @result += "Amount owed is #{total_charge}\n"
    @result += "You earned #{total_frequent_renter_points} frequent renter points"
    print @result
  end
  
  private
  
  def total_charge
    @rentals.inject(0){|sum, rental| sum + rental.charge}
  end
  
  def total_frequent_renter_points
    @rentals.inject(0){|sum, rental| sum + rental.frequent_renter_points}
  end
end
