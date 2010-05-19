require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Replace_Temp_with_Query'

$KCODE="UTF8"
class TC_Replace_Temp_with_Query < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end

  
  must "discount factor is 0.98 if base_price<=1000" do
    obj=Replace_Temp_with_Query.new(10,100)
    assert_equal(obj.price, 980)
  end
  
  must "discount factor is 0.95 if base_price > 1000" do
    obj=Replace_Temp_with_Query.new(10,101)
    assert_equal(obj.price, 959.5)
  end
end
