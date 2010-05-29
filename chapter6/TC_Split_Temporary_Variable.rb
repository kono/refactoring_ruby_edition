require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Split_Temporary_Variable'

$KCODE="UTF8"
class Array
  attr:finish
end
class TC_Split_Temporary_Variable < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end
  
  def setup
        @obj1 = Haggis.new(500,300,100,10)
        @obj2 = Haggis.new(400,200,50,5)
  end

  must "check the method 'distance_traveled' part.1" do
    expectation = 4750
    assert_equal(expectation, @obj1.distance_traveled(20))
  end
  
  must "check the method 'distance_traveled' part.2" do
    expectation = 14200
    assert_equal(expectation, @obj2.distance_traveled(20))
  end
  
end
