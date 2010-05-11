require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'tempfile'
require 'Extract_Method'

$KCODE="UTF8"
class TC_S6_1_with_local_val < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end

  def setup
    @obj = Extract_Method.new("kono")
    @obj.order_entry(10)
    @obj.order_entry(20)
    @obj.order_entry(30)
  end
  
  must "test1" do
    temp=Tempfile::new("foobar")
    $stdout=temp
    @obj.print_owing(10)
    $stdout=STDOUT
    temp.close
    temp.open
    result= temp.read
    expectation = "*************************\n***** Customer Owes *****\n*************************\nname: kono\namount: 72.0\n"
    temp.close
    assert_equal(result, expectation)
  end
end
