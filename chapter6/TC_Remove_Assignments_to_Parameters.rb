require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Remove_Assignments_to_Parameters'

$KCODE="UTF8"
class TC_Remove_Assignments_to_Parameters < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end

  must "test1" do
    assert_equal(50, discount(50,100,1000))
    assert_equal(49, discount(51, 100, 1000))
    assert_equal(48, discount(51, 101, 1000))
    assert_equal(44, discount(51, 101, 10001))
  end
end
