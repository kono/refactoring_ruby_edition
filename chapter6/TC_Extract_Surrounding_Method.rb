require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'tempfile'
require 'Extract_Surrounding_Method'

$KCODE="UTF8"
class TC_Extract_Surrounding_Method < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end

  def setup
    @kokeka = Person.new('Kokeka', '2007-09-05',nil, nil)
    @kokeko1 = Person.new('Kokeko', '2007-10-05', nil, @kokeka)
    @kokekakiikii1 = Person.new('Kokekakiikii', '2007-10-05', nil, @kokeka)
    @kokeko2 = Person.new('Kokeko', '2007-11-05', nil, @kokeko1)
    @kokekakiikii2 = Person.new('Kokeikakiikii', '2007-11-05', nil, @kokeko1)
    @kokekokko = Person.new('Kokekokko', '2007-12-05', nil, @kokeko2)
    @kokkokkokko = Person.new('Kokkokkokko','2007-12-05', nil, @kokeko2)
  end
  
  must "test1" do
    assert_equal(6, @kokeka.number_of_living_descendants)
    assert_equal(2, @kokeka.number_of_descendants_named('Kokeko'))
  end
end
