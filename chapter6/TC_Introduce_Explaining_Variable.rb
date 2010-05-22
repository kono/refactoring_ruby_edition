require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Introduce_Explaining_Variable'

$KCODE="UTF8"
class TC_Introducd_Explaining_Variable < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end
  
  def setup
        @obj1 = Introduce_Explaining_Variable.new(500,100)
        @obj2 = Introduce_Explaining_Variable.new(500,1)
        @obj3 = Introduce_Explaining_Variable.new(501,100)
  end

  
  must "if quantity is less than or equal to 500, there are no discount" do
    expectation = 500 * 100 + 100
    assert_equal(expectation, @obj1.price)
  end
  
  must "if quantity * unit_price * 0.1 is less than 100, shipping rates is quantity * unit_price * 0.1" do
    expectation = 500 * 1 + 500 * 1 * 0.1
    assert_equal(expectation, @obj2.price)
  end
  
  must "if quantity is grater than 500, 5 percents of amount which exceed 500 will be discounted" do
    expectation = 501 * 100 - (1 * 100 * 0.05) + 100
    assert_equal(expectation, @obj3.price)
  end
end
