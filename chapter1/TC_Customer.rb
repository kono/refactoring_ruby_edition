require 'rubygems'
require 'test/unit'
require 'must'
require 'Customer'
require 'kconv'

$KCODE="UTF8"
class TC_Customer < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end

  def setup
    @obj = Customer.new("kono")
    @movie1 = Movie.new("Star Wars",RegularPrice.new)
    @movie2 = Movie.new("District 9", NewReleasePrice.new)
    @movie3 = Movie.new("Ponyo",ChildrensPrice.new)
  end
  
  must "test1" do
    @obj.add_rental(Rental.new(@movie1, 7))
    @obj.add_rental(Rental.new(@movie2, 2))
    @obj.add_rental(Rental.new(@movie3, 5))
    @obj.statement
    result= "Rental Record for kono\n\tStar Wars\t9.5\n\tDistrict 9\t6\n\tPonyo\t4.5\nAmount owed is 20.0\nYou earned 4 frequent renter points"
    assert_equal(result, @obj.result)
  end
  must "test2" do
    @obj.add_rental(Rental.new(@movie1, 10))
    @obj.add_rental(Rental.new(@movie2, 15))
    @obj.add_rental(Rental.new(@movie3, 20))
    result="<h1>Rentals for <em>kono</em></h1><p>\n\tStar Wars: 14.0<br>\n\tDistrict 9: 45<br>\n\tPonyo: 27.0<br>\n<p>You owe <em>86.0</em><p>\nOn this rental you earned <em>4</em> frequent renter points<p>"
    assert_equal(result, @obj.html_statement)
  end
end
