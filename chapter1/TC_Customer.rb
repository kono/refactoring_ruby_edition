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
    @movie1 = Movie.new("Star Wars",Movie::REGULAR)
    @movie2 = Movie.new("District 9", Movie::NEW_RELEASE)
    @movie3 = Movie.new("Ponyo",Movie::CHILDRENS)
  end
  
  must "test1" do
    @obj.add_rental(Rental.new(@movie1, 7))
    @obj.add_rental(Rental.new(@movie2, 2))
    @obj.add_rental(Rental.new(@movie3, 5))
    @obj.statement
    result= "Rental Record for kono\n\tStar Wars\t9.5\n\tDistrict 9\t6\n\tPonyo\t4.5\nAmount owed is 20.0\nYou earned 4 frequent renter points"
    assert_equal(result, @obj.result)
  end
end
