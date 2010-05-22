require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Replace_Temp_with_Chain'

$KCODE="UTF8"
class TC_Replace_Temp_with_Chain < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end

  
  must "check if Select object is correct" do
    expectation = [1999,2000,2001,2002]
    assert_equal(expectation, main_proc.options)
  end
  
end
