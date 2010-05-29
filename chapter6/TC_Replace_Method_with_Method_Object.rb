require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Replace_Method_with_Method_Object'

$KCODE="UTF8"
class TC_Replace_Method_with_Method_Object < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end
  
  def setup
    @obj = Account.new
  end

  must "test_gamma" do
    assert_equal(340500, @obj.gamma(50,100,1000))
    assert_equal(2200, @obj.gamma(10,20,30))
    assert_equal(26500, @obj.gamma(100,80,60))
  end
end
